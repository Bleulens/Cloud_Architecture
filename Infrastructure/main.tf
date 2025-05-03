# Specify Terraform provider requirements
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Ensures compatibility with AWS provider version 5.x
    }
  }
}

# Configure the AWS provider
provider "aws" {
  region = var.aws_region # Dynamically sets AWS region from `variables.tf`
}

# Call the network module to deploy foundational infrastructure
module "network" {
  source         = "./modules/network" # References the reusable network module
  vpc_cidr_block = var.vpc_cidr_block  # Passes the VPC CIDR block
  subnet_configs = var.subnet_configs  # Passes the dynamic subnet map
}

# Call the routing module (if needed for project-specific routing rules)
module "routing" {
  source        = "./modules/routing"   # References routing logic module
  vpc_id        = module.network.vpc_id # Uses the VPC ID created by the network module
  route_entries = var.route_entries     # Passes project-specific route configurations
}

# Additional modules can be added here for security, monitoring, etc.
