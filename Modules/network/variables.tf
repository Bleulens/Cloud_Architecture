# CIDR block for the VPC
# This defines the overall network range that all subnets will reside within.
# Default value is a standard /16 network, providing flexibility for subnet allocation.
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# CIDR block for the public subnet
# This subnet is designated for resources needing direct internet access.
# Default is now set to a /24 subnet, which provides 256 IP addresses (minus AWS reserved IPs).
variable "subnet_cidr_block" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.0.0/24"
}

# AWS availability zone
# Determines which Availability Zone (AZ) the subnet will be deployed in.
# Default is set to "us-east-1a," but can be adjusted for redundancy or multi-AZ deployments.
variable "availability_zone" {
  description = "AWS availability zone"
  type        = string
  default     = "us-east-1a"
}

# CIDR block for the private subnet
# This subnet is designated for internal resources such as databases and backend services.
# Unlike the public subnet, this subnet does not provide direct internet access.
# Default is now set to a /24 subnet, ensuring separation between public and private resources.
variable "private_subnet_cidr_block" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24" # Default value, override if needed
}
