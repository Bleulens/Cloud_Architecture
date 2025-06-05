# IAM Role Name
variable "role_name" {
  description = "Name of the IAM role"
  type        = string
}

# Defines which AWS service can assume this IAM role
variable "assumed_by_service" {
  description = "AWS service allowed to assume this role"
  type        = string
}

# Standard tags for IAM resources
variable "default_tags" {
  description = "Standard tags passed from root module"
  type        = map(string)
}
