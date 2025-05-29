# Defines the CIDR block for the VPC.
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Defines a standard set of tags to be applied across all Terraform-managed resources.
variable "default_tags" {
  description = "Standard tags passed from root module"
  type        = map(string)
}

# Defines public subnet configurations dynamically.
variable "public_subnet_configs" {
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))

  validation {
    condition     = alltrue([for subnet in var.public_subnet_configs : can(regex("^10\\.0\\.(\\d{1,3})\\.0/24$", subnet.cidr_block))])
    error_message = "CIDR blocks must follow the 10.0.x.0/24 pattern."
  }
}
# Defines private subnet configurations dynamically.
variable "private_subnet_configs" {
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))

  validation {
    condition     = alltrue([for subnet in var.private_subnet_configs : can(regex("^10\\.0\\.(\\d{1,3})\\.0/24$", subnet.cidr_block))])
    error_message = "CIDR blocks must follow the 10.0.x.0/24 pattern."
  }
}

# Controls whether an Internet Gateway should be created.
variable "create_internet_gateway" {
  description = "Whether to create an Internet Gateway for public internet access"
  type        = bool
  default     = false
}

# Controls whether a NAT Gateway should be created.
variable "create_nat_gateway" {
  description = "Whether to create a NAT Gateway for private subnet internet access"
  type        = bool
  default     = false
}

# Defines the subnet ID where NAT Gateway should be deployed.
variable "nat_subnet_id" {
  description = "Subnet ID where NAT Gateway should be placed"
  type        = string
}

# Defines the type of subnets (e.g., public or private).
variable "subnet_type" {
  type = string

  validation {
    condition     = contains(["public", "private"], var.subnet_type)
    error_message = "Subnet type must be 'public' or 'private'."
  }
}
