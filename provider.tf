terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.33.0"
    }
  }
  backend "s3" {
    bucket = "tname-myproje-terraform-dev-euc1"
    key    = "enterprise-network/terraform.tfstate"
    region = "eu-central-1"
  }
}

provider "aws" {
  region = "eu-central-1"
}

