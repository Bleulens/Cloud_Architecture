# Defines the CloudTrail trail name
variable "trail_name" {
  description = "Name of the CloudTrail trail"
  type        = string
  default     = "my-cloudtrail"
}

# Controls whether logging is enabled
variable "enable_logging" {
  description = "Enables or disables CloudTrail logging"
  type        = bool
  default     = true
}

# Specifies whether CloudTrail should include global service events
variable "include_global_service_events" {
  description = "Determines if global events (e.g., IAM activities) are tracked"
  type        = bool
  default     = false
}

# Defines the S3 bucket name used for log storage
# This should reference the output from the S3 module
variable "s3_bucket_name" {
  description = "S3 bucket where CloudTrail logs are stored"
  type        = string
}

# Defines the IAM role for CloudTrail log delivery
# This should reference the output from the IAM module
variable "cloud_watch_logs_role_arn" {
  description = "IAM role ARN for CloudTrail log delivery"
  type        = string
}

# Configures event selectors to track specific types of API activity
variable "event_read_write_type" {
  description = "Specifies whether CloudTrail tracks read, write, or all events"
  type        = string
  default     = "WriteOnly"
}

variable "include_management_events" {
  description = "Determines if management events (e.g., IAM changes) are tracked"
  type        = bool
  default     = true
}
