# TerraformS3_remote_state
This Terraform config repo deploys an S3 Bucket, in an AWS Account/ Region

In order to use the repo, follow the below steps-:

1. Checkout or unzip the TerraformS3_remote_state GitHub repo to a directory on your local workstation, set the AWS CLI credentials and AWS region to deploy, in your local workstation, for a user with Full Admin Access in IAM in the AWS account you wish to deploy

2. Run the below commands, once you have modified the terraform.tfvars file (in the top level directory) for appropriate input variable values,

terraform init

terraform plan

terraform apply
