terraform {
  backend "s3" {
    bucket = "terraform-myproje-euc1-dev"
    key    = "network/terraform.tfstate"
    region = "eu-central-1"
  }
}

provider "aws" {
  region = "eu-central-1"
}