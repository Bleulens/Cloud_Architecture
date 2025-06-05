# Defines the deployment environment (e.g., development, staging, production).
# This variable ensures Terraform configurations dynamically adapt based on the specified environment.
variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "development"
}

# Specifies the application name associated with the resource.
# Useful for logically grouping infrastructure components.
variable "application" {
  description = "Application name"
  type        = string
}

# Dynamically generates a CloudWatch Log Group name based on the application and environment.
# This keeps log groups structured for easier management and scalability.
variable "log_group_name" {
  description = "Name of the CloudWatch Log Group"
  type        = string
  default     = "logs-${var.application}-${var.environment}"
}

# Defines how long logs should be retained within CloudWatch.
# Includes validation to ensure retention stays within the range of 1 to 365 days.
variable "retention_days" {
  description = "Log retention period in days"
  type        = number
  default     = 7
  validation {
    condition     = var.retention_days >= 1 && var.retention_days <= 365
    error_message = "Retention days must be between 1 and 365."
  }
}

# Defines a standard set of tags applied to all Terraform-managed resources.
# Centralizing tags ensures consistency, simplifies automation, and improves cost tracking.
variable "default_tags" {
  description = "Standard tags passed from root module"
  type        = map(string)
}

# Defines the CloudWatch Log Stream name
# Used to specify the stream where logs are written within a CloudWatch Log Group
variable "log_stream_name" {
  description = "Name of the CloudWatch Log Stream"
  type        = string
}

# Defines the CloudWatch Log Metric Filter name
# Metric filters extract patterns from logs and create CloudWatch metrics
variable "metric_filter_name" {
  description = "Name of the CloudWatch Log Metric Filter"
  type        = string
  default     = "MyAppAccessCount"
}

# Specifies the pattern that log entries must match to trigger the metric transformation
# Should be defined appropriately based on log format
variable "metric_filter_pattern" {
  description = "Pattern to match in log events for triggering metrics"
  type        = string
  default     = "" # Consider defining a pattern for better filtering
}

# Defines the name assigned to the transformed CloudWatch metric
# This name will be visible in CloudWatch Metrics
variable "metric_transformation_name" {
  description = "Name assigned to the transformed metric"
  type        = string
  default     = "EventCount"
}

# Namespace for the metric transformation, organizing metrics within CloudWatch
# Helps in categorizing and filtering custom metrics
variable "metric_transformation_namespace" {
  description = "Namespace under which the metric transformation is registered"
  type        = string
  default     = "YourNamespace"
}

# Numeric value assigned to the metric when the filter matches the defined pattern
# Typically set to "1" for event counting
variable "metric_transformation_value" {
  description = "Value assigned to the metric upon matching the filter pattern"
  type        = string
  default     = "1"
}

# Defines the CloudWatch Dashboard name
# Used for easy identification in AWS
variable "dashboard_name" {
  description = "Name of the CloudWatch Dashboard"
  type        = string
  default     = "my-dashboard"
}

# EC2 instance ID to monitor within the dashboard
# Ensures metrics are associated with the correct instance
variable "instance_id" {
  description = "EC2 instance to monitor"
  type        = string
}

# AWS region where the instance and metrics are located
variable "aws_region" {
  description = "AWS region for dashboard resources"
  type        = string
  default     = "us-east-1"
}

# Defines the specific metric being tracked
# Common metrics include CPUUtilization, NetworkIn, NetworkOut, etc.
variable "metric_name" {
  description = "Metric being tracked"
  type        = string
  default     = "CPUUtilization"
}

# Time period in seconds for metric aggregation
# Controls how frequently data points are collected
variable "metric_period" {
  description = "Metric aggregation period in seconds"
  type        = number
  default     = 300
}

# Statistical method used to process metric data
# Common values: Average, Sum, Maximum, Minimum
variable "metric_stat" {
  description = "Metric statistical aggregation method"
  type        = string
  default     = "Average"
}

# Title for the metric widget on the dashboard
variable "metric_title" {
  description = "Title of the metric widget"
  type        = string
  default     = "EC2 Instance CPU"
}

# Grid positioning and sizing for metric widget
variable "metric_x" {
  description = "X position for metric widget"
  type        = number
  default     = 0
}

variable "metric_y" {
  description = "Y position for metric widget"
  type        = number
  default     = 0
}

variable "metric_width" {
  description = "Width of metric widget"
  type        = number
  default     = 12
}

variable "metric_height" {
  description = "Height of metric widget"
  type        = number
  default     = 6
}

# Grid positioning and sizing for text widget
variable "text_x" {
  description = "X position for text widget"
  type        = number
  default     = 0
}

variable "text_y" {
  description = "Y position for text widget"
  type        = number
  default     = 7
}

variable "text_width" {
  description = "Width of text widget"
  type        = number
  default     = 3
}

variable "text_height" {
  description = "Height of text widget"
  type        = number
  default     = 3
}

# Content displayed within the text widget
variable "text_content" {
  description = "Content for text widget"
  type        = string
  default     = "Hello world"
}
