# AWS region for deploying cloud resources
variable "aws_region" {
  description = "The AWS region where infrastructure is deployed"
  type        = string
}

# CIDR block for the VPC
variable "vpc_cidr_block" {
  description = "CIDR block defining the VPC boundaries"
  type        = string
}

# Map of subnets with configurations (used by the network module)
variable "subnet_configs" {
  description = "Configuration map for dynamically creating subnets"
  type = map(object({
    cidr_block        = string
    availability_zone = string
    is_public         = bool
  }))
}

# ---------------------------------------
# Flags to determine which resources to deploy
# ---------------------------------------
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

# ---------------------------------------
# GitHubActions variables
# ---------------------------------------
variable "github_org" {
  description = "GitHub organization name"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
}
