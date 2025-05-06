# Define variables for the security group module
# These allow customization when the module is called

variable "name" {
  description = "Security group name" # Describes the purpose of this variable
  type        = string                # Expects a string input (e.g., "web-sg")
}

variable "description" {
  description = "Security group description" # Helps provide context for what this SG is used for
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the security group" # Every security group must be associated with a VPC
  type        = string
}

variable "ingress_rules" {
  description = "List of ingress (incoming) rules for the security group"
  type        = list(map(string)) # Accepts a list of security rules with key-value pairs
}

variable "egress_rules" {
  description = "List of egress (outgoing) rules for the security group"
  type        = list(map(string)) # Defines outbound traffic permissions
}

# Defines a standard set of tags to be applied across all Terraform-managed resources.
# This variable allows consistent tagging for better organization, cost tracking, and automation.
variable "default_tags" {
  description = "Standard tags passed from root module"
  type        = map(string)
}
