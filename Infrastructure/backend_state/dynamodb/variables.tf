variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table used for Terraform state locking. This should be unique within your AWS account in the chosen region."
  type        = string
  default     = "terraform-state-lock"
  # The default name for the DynamoDB table used for state locking.
}

variable "billing_mode" {
  description = "The billing mode for the DynamoDB table. Options are 'PROVISIONED' or 'PAY_PER_REQUEST'."
  type        = string
  default     = "PROVISIONED"
  # The default billing mode for the DynamoDB table. 'PROVISIONED' requires
  # specifying read and write capacity. 'PAY_PER_REQUEST' bills based on actual usage.

  validation {
    condition     = contains(["PROVISIONED", "PAY_PER_REQUEST"], var.billing_mode)
    error_message = "Billing mode must be either PROVISIONED or PAY_PER_REQUEST."
    # Input validation to ensure the billing mode is one of the allowed values.
  }
}

variable "read_capacity" {
  description = "The number of read capacity units to provision for the DynamoDB table. Only applicable when billing_mode is 'PROVISIONED'."
  type        = number
  default     = 5
  # The default number of read capacity units to provision. This is only used
  # if the billing_mode is set to 'PROVISIONED'.
}

variable "write_capacity" {
  description = "The number of write capacity units to provision for the DynamoDB table. Only applicable when billing_mode is 'PROVISIONED'."
  type        = number
  default     = 5
  # The default number of write capacity units to provision. This is only used
  # if the billing_mode is set to 'PROVISIONED'.
}

variable "environment" {
  description = "The environment where this DynamoDB table is used (e.g., Dev, Staging, Prod)."
  type        = string
  default     = "Dev"
  # The default environment tag for the DynamoDB table. This helps in organizing
  # and categorizing resources.
}
