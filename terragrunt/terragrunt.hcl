locals {
  region          = "us-east-1"
  profile         = "Sog0"

  common_inputs = {
    app_name        = "demoapp"
    instance_type   = "t2.micro"
    azs             = ["us-east-1a", "us-east-1b"]
    public_subnets_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "aws" {
  region  = "${local.region}"
  profile = "${local.profile}"
}
EOF
}

generate "terraform" {
  path      = "versions.tf"
  if_exists = "overwrite"
  contents  = <<EOF
terraform {
  required_version = ">= 1.2.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}
EOF
}
