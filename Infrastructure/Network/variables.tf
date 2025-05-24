# ---------------------------------------
# VPC Configuration Variables
# ---------------------------------------
variable "vpc_cidr_block" {
  description = "CIDR block defining the VPC boundaries"
  type        = string
}

# ---------------------------------------
# Subnet Configuration Variables
# ---------------------------------------
variable "subnet_configs" {
  description = "Map of subnets with configurations"
  type = map(object({
    cidr_block        = string
    availability_zone = string
    is_public         = bool
  }))
}

# ---------------------------------------
# Routing Configuration Variables
# ---------------------------------------
variable "route_entries" {
  description = "Route table entries for networking module"
  type = list(object({
    destination_cidr_block = string
    gateway_id             = string
  }))
}
