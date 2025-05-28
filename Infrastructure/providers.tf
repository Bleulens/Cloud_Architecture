# Configure the AWS provider
provider "aws" {
  region = var.aws_region # Dynamically sets AWS region from `variables.tf`
}

# Specify Terraform provider requirements
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.98.0" # Ensures compatibility with AWS provider version 5.x
    }
  }
}

# Define required Terraform version
terraform {
  required_version = "~> 1.12.1" # Ensures Terraform version 1.3.x
}


