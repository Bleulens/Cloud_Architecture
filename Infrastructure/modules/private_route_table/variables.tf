variable "vpc_id" {
  description = "The ID of the VPC where subnets will be created"
  type        = string
}

# Defines private subnet configurations dynamically.
variable "private_subnet_configs" {
  type = map(object({
    cidr_block        = string
    availability_zone = string
    layer_name        = string
  }))

  validation {
    condition     = alltrue([for subnet in var.private_subnet_configs : can(regex("^10\\.0\\.(\\d{1,3})\\.0/24$", subnet.cidr_block))])
    error_message = "CIDR blocks must follow the 10.0.x.0/24 pattern."
  }
}


variable "private_subnet_ids" {
  description = "IDs of private subnets, keyed by their logical names from subnet configurations."
  type        = map(string)
}

variable "nat_gateway_id" {
  type = string
}

# Defines a standard set of tags to be applied across all Terraform-managed resources.
variable "default_tags" {
  description = "Standard tags passed from root module"
  type        = map(string)
}
