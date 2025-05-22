variable "bucket_name" {
  description = "The name of the S3 bucket storing Terraform state."
  type        = string
}

variable "iam_role_name" {
  description = "The IAM role for Terraform backend access."
  default     = "TerraformS3StateRole"
}

variable "default_tags" {
  description = "Default tags applied to all resources."
  type        = map(string)
  default = {
    Environment = "dev" # Adjust as needed
    ManagedBy   = "Terraform"
  }
}

# Retrieve the current AWS account ID for oidc authentication
data "aws_caller_identity" "current" {}

variable "aws_account_id" {
  description = "AWS Account ID retrieved dynamically"
  type        = string
  default     = data.aws_caller_identity.current.account_id
}

variable "terraform_role_name" {
  description = "IAM role used by Terraform for execution"
  type        = string
}

variable "github_org" {
  description = "GitHub organization for OIDC authentication"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository for OIDC authentication"
  type        = string
}

variable "dyanmodb_table_name" {
  description = "DynamoDB table name for OIDC authentication"
  type        = string
}
