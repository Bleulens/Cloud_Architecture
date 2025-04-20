# AWS region for deploying cloud resources
# Determines the region where all infrastructure components will be provisioned.
# Default is set to "us-east-1," but can be overridden per deployment.
variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1" # Change based on preference
}
