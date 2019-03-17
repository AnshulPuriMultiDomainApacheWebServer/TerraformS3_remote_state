/**
 * # aws-terraform-S3-for_remotestate
 *
 *This outputs.tf file of the module outputs variables to be used by other modules
*/

output "S3Bucket_name_RemoteState_terraform" {
  value = "${aws_s3_bucket.remotetfstates3.id}"
  description = "The name of the S3 Bucket to store the state file for the terraform configuration"
}

output "S3Bucket_region_RemoteState_terraform" {
  value = "${aws_s3_bucket.remotetfstates3.region}"
  description = "The region of the S3 Bucket to store the state file for the terraform configuration"
}
