variable "vpc_id" {
  description = "The ID of the VPC where subnets will be created"
  type        = string
}

# Defines public subnet configurations dynamically.
variable "public_subnet_configs" {
  type = map(object({
    cidr_block        = string
    availability_zone = string
    layer_name        = string
  }))

  validation {
    condition     = alltrue([for subnet in var.public_subnet_configs : can(regex("^10\\.0\\.(\\d{1,3})\\.0/24$", subnet.cidr_block))])
    error_message = "CIDR blocks must follow the 10.0.x.0/24 pattern."
  }
}

variable "igw_id" {
  type = string
}

variable "public_subnet_ids" {
  description = "A map of public subnet IDs, keyed by their logical names."
  type        = map(string)
}

# Defines a standard set of tags to be applied across all Terraform-managed resources.
variable "default_tags" {
  description = "Standard tags passed from root module"
  type        = map(string)
}
