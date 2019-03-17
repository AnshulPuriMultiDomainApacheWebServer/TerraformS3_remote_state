/**
 * # aws-terraform-S3-for_remotestate
 *
 *This main.tf file of the module sets up a S3 Bucket,
 *to be used for storing the Remote State of the terraform configuration. 
*/

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.aws_region}"
}

  # Get the ARN for the FullAdminAccess User to apply S3 Bucket Policies later
data "aws_caller_identity" "current" {}


  #S3 Bucket to store the Remote State of the terraform configuration
resource "aws_s3_bucket" "remotetfstates3" {
  bucket        = "terraform-remote-state-${var.customer_name}"
  acl           = "private"
  force_destroy = true

  versioning {
    enabled = true
  }

  tags {
    Name = "RemoteTFStateS3Bucket_${var.customer_name}"
  }
}

resource "aws_s3_bucket_policy" "RemoteTFStateS3Bucket_policy" {
  bucket = "${aws_s3_bucket.remotetfstates3.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "RemoteTFStateS3Bucket_policy",
  "Statement": [
    {
      "Sid": "FullAdminAccess",
      "Effect": "Allow",
      "Principal": { "AWS": "${data.aws_caller_identity.current.arn}" },
      "Action": "s3:*",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.remotetfstates3.id}/*"
    }
  ]
}
POLICY
}