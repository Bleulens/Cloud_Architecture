terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region # Pulling the value dynamically from `variables.tf`
}

# Reference the VPC module instead of directly defining the VPC
module "network" {
  source                    = "./modules/network"
  vpc_cidr_block            = var.vpc_cidr_block
  subnet_cidr_block         = var.subnet_cidr_block         # Public Subnet
  private_subnet_cidr_block = var.private_subnet_cidr_block # Private Subnet
}
