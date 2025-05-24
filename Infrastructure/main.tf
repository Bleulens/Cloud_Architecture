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

# Additional modules can be added here for security, monitoring, etc.
