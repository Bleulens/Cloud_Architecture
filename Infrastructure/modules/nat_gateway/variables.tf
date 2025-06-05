# Controls whether a NAT Gateway should be created.
variable "create_nat_gateway" {
  description = "Whether to create a NAT Gateway for private subnet internet access"
  type        = bool
  default     = false
}

variable "nat_subnet_id_for_nat_gateway" {
  description = "The ID of the public subnet where the NAT Gateway will be deployed."
  type        = string
}

# Defines a standard set of tags to be applied across all Terraform-managed resources.
variable "default_tags" {
  description = "Standard tags passed from root module"
  type        = map(string)
}
