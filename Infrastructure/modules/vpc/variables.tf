# Defines the CIDR block for the VPC.
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  description = "Controls whether instances in the VPC get public DNS hostnames."
  type        = bool
  default     = true # Or false, depending on your preference
}

variable "enable_dns_support" {
  description = "Controls whether DNS resolution is enabled for the VPC."
  type        = bool
  default     = true # Or false
}

# Defines a standard set of tags to be applied across all Terraform-managed resources.
variable "default_tags" {
  description = "Standard tags passed from root module"
  type        = map(string)
}

