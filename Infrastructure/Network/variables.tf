# Variables needed to call the network module
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet_configs" {
  description = "Configuration map for subnets"
  type = map(object({
    cidr_block        = string
    availability_zone = string
    is_public         = bool
  }))
}
