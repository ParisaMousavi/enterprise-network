locals {
  vpc_cidr_block = {
    "acc"  = "10.102.0.0/16",
    "dev"  = "10.101.0.0/16",
    "prod" = "10.100.0.0/16"
  }
  private_subnets = {
    "dev" = {
      "private_1" = {
        availability_zone = "eu-central-1a"
        cidr_block        = "10.101.1.0/24"
        name              = "${module.name.snet_name}-private-1"
      },
      "private_2" = {
        availability_zone = "eu-central-1b"
        cidr_block        = "10.101.2.0/24"
        name              = "${module.name.snet_name}-private-2"
      }
    },
    "acc" = {
      "private_1" = {
        availability_zone = "eu-central-1a"
        cidr_block        = "10.102.1.0/24"
        name              = "${module.name.snet_name}-private-1"
      },
      "private_2" = {
        availability_zone = "eu-central-1b"
        cidr_block        = "10.102.2.0/24"
        name              = "${module.name.snet_name}-private-2"
      }
    }
  }

  public_subnets = {
    "dev" = {
      "public_1" = {
        availability_zone = "eu-central-1a"
        cidr_block        = "10.101.3.0/24"
        name              = "${module.name.snet_name}-public-1"
      },
      "public_2" = {
        availability_zone = "eu-central-1b"
        cidr_block        = "10.101.4.0/24"
        name              = "${module.name.snet_name}-public-2"
      },
      "eks_1" = {
        availability_zone = "eu-central-1b"
        cidr_block        = "10.101.5.0/24"
        name              = "${module.name.snet_name}-eks-1"
      },
      "eks_2" = {
        availability_zone = "eu-central-1b"
        cidr_block        = "10.101.6.0/24"
        name              = "${module.name.snet_name}-eks-2"
      }
    },
    "acc" = {
      "public_1" = {
        availability_zone = "eu-central-1a"
        cidr_block        = "10.102.3.0/24"
        name              = "${module.name.snet_name}-public-1"
      },
      "public_2" = {
        availability_zone = "eu-central-1b"
        cidr_block        = "10.102.4.0/24"
        name              = "${module.name.snet_name}-public-2"
      }
    }
  }
}

module "name" {
  source           = "github.com/ParisaMousavi/aws-naming?ref=main"
  prefix           = var.prefix
  name             = var.name
  environment      = var.environment
  region_shortname = var.region_shortname
}

module "network" {
  source               = "github.com/ParisaMousavi/aws-vpc-v2?ref=main"
  cidr_block           = local.vpc_cidr_block[lower(var.environment)]
  enable_dns_support   = true
  enable_dns_hostnames = true
  private_subnets      = local.private_subnets[lower(var.environment)]
  public_subnets       = local.public_subnets[lower(var.environment)]
  additional_tags = {
    CostCenter = "ABC000CBA"
    By         = "parisamoosavinezhad@hotmail.com"
    Name       = module.name.vpc_name
  }
}

output "network" {
  value = module.network
}
