# Number of EC2 instances to launch (Can vary per instance type)
variable "instance_count" {
  description = "Number of EC2 instances to deploy"
  type        = number
}

# Instance type (Allows flexibility for different types of EC2 deployments)
variable "instance_type" {
  description = "EC2 instance type (e.g., t3.micro, t3.large, t3.medium)"
  type        = string
}
variable "subnet_type" {
  description = "Specify whether instances should be in public or private subnets"
  type        = string
  default     = "private"
}

# Defines a standard set of tags to be applied across all Terraform-managed resources.
# This variable allows consistent tagging for better organization, cost tracking, and automation.
variable "default_tags" {
  description = "Standard tags passed from root module"
  type        = map(string)
}
