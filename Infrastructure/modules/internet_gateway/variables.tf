variable "vpc_id" {
  description = "The ID of the VPC where the Internet Gateway will be created"
  type        = string
}

# Controls whether an Internet Gateway should be created.
variable "create_internet_gateway" {
  description = "Whether to create an Internet Gateway for public internet access"
  type        = bool
  default     = false
}

# Defines a standard set of tags to be applied across all Terraform-managed resources.
variable "default_tags" {
  description = "Standard tags passed from root module"
  type        = map(string)
}
