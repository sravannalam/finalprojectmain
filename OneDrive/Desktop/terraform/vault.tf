################################################################################
# HashiCorp Vault
provider "vault" {
  address      = var.vault_addr
  ca_cert_file = var.vault_cacert
}

data "vault_aws_access_credentials" "aws_a103" {
  backend = "aws"
  role    = "terraform_a103"
  type    = "sts"
}

data "vault_aws_access_credentials" "aws_a133" {
  backend = "aws"
  role    = "terraform_a133"
  type    = "sts"
}

data "vault_aws_access_credentials" "aws_a134" {
  backend = "aws"
  role    = "terraform_a134"
  type    = "sts"
}