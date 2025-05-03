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
