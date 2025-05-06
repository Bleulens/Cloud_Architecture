# Variable: vpc_cidr_block
# Defines the overall network range for the VPC.
# The default /16 subnet provides flexibility for dividing the VPC into multiple subnets.
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Variable: subnet_configs
# A map of subnet configurations, allowing dynamic subnet creation.
# Each subnet entry contains:
# - cidr_block: Defines the subnet’s IP range.
# - availability_zone: Specifies which AWS availability zone the subnet is placed in.
# - is_public: Determines if instances launched in this subnet get public IPs.

variable "subnet_configs" {
  type = map(object({
    cidr_block        = string
    availability_zone = string
    is_public         = bool
  }))

  # Validation: Ensures all subnet CIDR blocks follow the "10.0.X.0/24" format.
  validation {
    condition = alltrue([
      for subnet in values(var.subnet_configs) : can(regex("^10\\.0\\.[0-9]+\\.0/24$", subnet.cidr_block))
    ])
    error_message = "Each subnet CIDR block must follow the 10.0.X.0/24 format."
  }
}


# Defines a standard set of tags to be applied across all Terraform-managed resources.
# This variable allows consistent tagging for better organization, cost tracking, and automation.
variable "default_tags" {
  description = "Standard tags passed from root module"
  type        = map(string)
}
