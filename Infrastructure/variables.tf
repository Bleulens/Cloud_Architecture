# AWS region for deploying cloud resources
variable "aws_region" {
  description = "The AWS region where infrastructure is deployed"
  type        = string
}

# CIDR block for the VPC
variable "vpc_cidr_block" {
  description = "CIDR block defining the VPC boundaries"
  type        = string
}

# Map of subnets with configurations (used by the network module)
variable "subnet_configs" {
  description = "Configuration map for dynamically creating subnets"
  type = map(object({
    cidr_block        = string
    availability_zone = string
    is_public         = bool
  }))
}

# Defines a set of default tags applied across all resources.
# Helps ensure consistency in tagging for organization, tracking, and automation.
variable "default_tags" {
  description = "Standard tags for all resources"
  type        = map(string)
  default = {
    Environment = "production"
    Application = "serviceA"
  }
}

