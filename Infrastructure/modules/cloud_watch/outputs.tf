# Outputs the CloudWatch Log Group name
# Allows referencing the log group in other modules or configurations
output "log_group_name" {
  description = "Name of the CloudWatch Log Group"
  value       = var.log_group_name
}

# Outputs the CloudWatch Log Stream name
# Provides access for monitoring log streams within CloudWatch
output "log_stream_name" {
  description = "Name of the CloudWatch Log Stream"
  value       = var.log_stream_name
}

# Outputs the CloudWatch Log Metric Filter name
# Useful for tracking metric filters used in log monitoring
output "metric_filter_name" {
  description = "Name of the CloudWatch Log Metric Filter"
  value       = var.metric_filter_name
}

# Outputs the CloudWatch Dashboard name
# Allows external modules to reference the dashboard for monitoring setups
output "dashboard_name" {
  description = "Name of the CloudWatch Dashboard"
  value       = var.dashboard_name
}

# Outputs the EC2 instance ID linked to the dashboard
# Ensures proper instance monitoring across CloudWatch components
output "instance_id" {
  description = "EC2 instance ID monitored by the CloudWatch Dashboard"
  value       = var.instance_id
}

# Outputs the AWS region used for CloudWatch resources
# Ensures alignment across multi-region deployments
output "aws_region" {
  description = "AWS region associated with CloudWatch resources"
  value       = var.aws_region
}

# Outputs CloudWatch metric details for reference
# Helps link metric monitoring across other modules
output "metric_name" {
  description = "CloudWatch metric being tracked"
  value       = var.metric_name
}

# Outputs the transformed metric name for CloudWatch
# Useful for referencing the created metric in monitoring tools
output "metric_transformation_name" {
  description = "Name assigned to the transformed metric"
  value       = var.metric_transformation_name
}

# Outputs the namespace under which the metric transformation is registered
# Helps in organizing custom metrics within CloudWatch
output "metric_transformation_namespace" {
  description = "Namespace under which the metric transformation is registered"
  value       = var.metric_transformation_namespace
}

# Outputs the log retention period
# Ensures consistency in managing log expiration policies across environments
output "retention_days" {
  description = "Log retention period in days"
  value       = var.retention_days
}

# Outputs the default tags applied to all resources
# Helps maintain consistent tagging for resource identification and cost tracking
output "default_tags" {
  description = "Standard tags applied to resources"
  value       = var.default_tags
}
