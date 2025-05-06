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

# Subnet ID where instances should be placed
variable "subnet_id" {
  description = "Subnet ID for placing EC2 instances"
  type        = string
}

# Defines a standard set of tags to be applied across all Terraform-managed resources.
# This variable allows consistent tagging for better organization, cost tracking, and automation.
variable "default_tags" {
  description = "Standard tags passed from root module"
  type        = map(string)
}
