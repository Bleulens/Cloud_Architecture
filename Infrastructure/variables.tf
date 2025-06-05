# AWS region for deploying cloud resources
variable "aws_region" {
  description = "The AWS region where infrastructure is deployed"
  type        = string
}

variable "environment" {
  description = "The environment name"
  type        = string
}

# CIDR block for the VPC
variable "vpc_cidr_block" {
  description = "CIDR block defining the VPC boundaries"
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
# Defines private subnet configurations dynamically.
variable "private_subnet_configs" {
  type = map(object({
    cidr_block        = string
    availability_zone = string
    layer_name        = string
  }))

  validation {
    condition     = alltrue([for subnet in var.private_subnet_configs : can(regex("^10\\.0\\.(\\d{1,3})\\.0/24$", subnet.cidr_block))])
    error_message = "CIDR blocks must follow the 10.0.x.0/24 pattern."
  }
}

# ---------------------------------------
# Flags to determine which resources to deploy
# ---------------------------------------

variable "create_internet_gateway" {
  description = "Flag to determine whether to deploy an Internet Gateway"
  type        = bool
  default     = false
}

variable "create_nat_gateway" {
  description = "Flag to determine whether to deploy a Nat Gateway"
  type        = bool
  default     = false
}

variable "deploy_application" {
  description = "Flag to determine whether to deploy the application"
  type        = bool
  default     = false
}

variable "deploy_compute" {
  description = "Flag to determine whether to deploy the compute resources"
  type        = bool
  default     = false
}

variable "deploy_storage" {
  description = "Flag to determine whether to deploy the storage resources"
  type        = bool
  default     = false
}

variable "deploy_database" {
  description = "Flag to determine whether to deploy the database resources"
  type        = bool
  default     = false
}

# Defines a standard set of tags to be applied across all Terraform-managed resources.
# This variable allows consistent tagging for better organization, cost tracking, and automation.
variable "default_tags" {
  description = "Standard tags passed from root module"
  type        = map(string)
}

# ---------------------------------------
# GitHubActions variables
# ---------------------------------------
# variable "github_org" {
#   description = "GitHub organization name"
#   type        = string
# }

# variable "github_repo" {
#   description = "GitHub repository name"
#   type        = string
# }
