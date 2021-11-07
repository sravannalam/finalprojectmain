################################################################################
# Terraform Config
terraform {
  backend "s3" {
    dynamodb_table = "tf-state-lock-6f55d38f048b"       # Get this value from the shared Services Acct S3 bucket ex. a103 s3 bucket name
    bucket         = "tf-state-backend-6f55d38f048b"    # Just change this number value to the one collected above, they should both match the last value
    key            = "o2/stacks/loyalty_dev_apigateway" # Change to correct folder you are working in, and the correct org, org name - aws-o1/o2/o3/o4
    region         = "us-west-2"
    encrypt        = true
  }
}
locals {
  fqdn = "${var.environment}.${var.hostname_prefix}.${var.domain}"
}