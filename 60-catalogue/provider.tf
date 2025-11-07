terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.16.0"
    }
  }
  backend "s3" {
    bucket = "azhar-terraform-dev"
    key    = "roboshop-dev-infra-60-catalogue"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true

  }
}

provider "aws" {
  # Configuration options
}