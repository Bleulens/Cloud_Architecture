variable "function_name" {
  description = "Lambda function name"
  type        = string
}

variable "runtime" {
  description = "Lambda runtime version"
  type        = string
  default     = "python3.9"
}

variable "handler" {
  description = "Lambda function handler"
  type        = string
  default     = "lambda_function.lambda_handler"
}

variable "memory_size" {
  description = "Lambda memory allocation"
  type        = number
  default     = 128
}

variable "timeout" {
  description = "Lambda execution timeout"
  type        = number
  default     = 10
}

variable "environment_variables" {
  description = "Lambda environment variables"
  type        = map(string)
  default = {
    LOG_LEVEL = "info"
    STAGE     = "dev"
  }
}

variable "log_retention_days" {
  description = "CloudWatch log retention period"
  type        = number
  default     = 14
}

variable "default_tags" {
  description = "Global tagging strategy for resources"
  type        = map(string)
}
variable "filename" {
  description = "Path to the local ZIP file"
  type        = string
  default     = null
}

variable "s3_bucket" {
  description = "S3 bucket name"
  type        = string
  default     = null
}

variable "s3_key" {
  description = "S3 object key"
  type        = string
  default     = null
}

variable "source_code_hash" {
  description = "Base64-encoded SHA256 hash of the Lambda source code"
  type        = string
  default     = null

}

variable "enable_deny" {
  description = "Enable deny policy"
  type        = bool
}

variable "deny_actions" {
  description = "Actions to deny in IAM policy"
  type        = list(string)
}

variable "role_name" {
  description = "IAM role name for Lambda"
  type        = string
}

variable "policy_resources" {
  description = "Resources affected by IAM policy"
  type        = list(string)
}

variable "policy_actions" {
  description = "Actions allowed by IAM policy"
  type        = list(string)
}

variable "assumed_by_service" {
  description = "Service assuming IAM role"
  type        = string
}

variable "deny_resources" {
  description = "Resources explicitly denied"
  type        = list(string)
}

variable "policy_name" {
  description = "Name of IAM policy"
  type        = string
}

variable "source_file" {
  description = "Path to lambda source file"
  type        = string
}

variable "output_path" {
  description = "Path for lambda zip archive"
  type        = string

}

variable "deploy_via_s3" {
  description = "Flag to determine deployment method (true = S3, false = local)"
  type        = bool
  default     = false
}

variable "log_group_name" {
  description = "Name of CloudWatch log group"
  type        = string

}

variable "log_stream_name" {
  description = "Name of CloudWatch log stream"
  type        = string
}

variable "instance_id" {
  description = "EC2 instance ID"
  type        = string
}

variable "application" {
  description = "Name of the application"
  type        = string
}

variable "metric_filter_name" {
  description = "Name of the CloudWatch Log Metric Filter"
  type        = string
}
