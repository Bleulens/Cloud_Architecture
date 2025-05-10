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

# IAM Policy Name
variable "policy_name" {
  description = "Name of the IAM policy"
  type        = string
}

# IAM Policy Actions (List of Allowed Actions)
variable "policy_actions" {
  description = "Actions that the IAM policy allows"
  type        = list(string)
}

# IAM Policy Resources
variable "policy_resources" {
  description = "Resources this IAM policy applies to"
  type        = list(string)
}

# Enables deny rules in the policy
variable "enable_deny" {
  description = "Toggle for enabling deny statements in IAM policies"
  type        = bool
}

# IAM Policy Actions to explicitly deny
variable "deny_actions" {
  description = "Actions to explicitly deny in the policy"
  type        = list(string)
}

# IAM Policy Resources to explicitly deny
variable "deny_resources" {
  description = "Resources this IAM deny policy applies to"
  type        = list(string)
}

# Standard tags for IAM resources
variable "default_tags" {
  description = "Standard tags passed from root module"
  type        = map(string)
}
