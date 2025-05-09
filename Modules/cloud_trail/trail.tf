# Creates an AWS CloudTrail resource for tracking API activity
resource "aws_cloudtrail" "main" {
  name                          = var.trail_name                    # Name of the CloudTrail trail
  s3_bucket_name                = module.s3.bucket_name             # References the S3 bucket module for log storage
  include_global_service_events = var.include_global_service_events # Determines whether global events are logged
  enable_logging                = var.enable_logging                # Enables or disables logging

  # References the IAM role from the IAM module to grant CloudTrail permissions
  cloud_watch_logs_role_arn = module.iam.role_arn

  # Defines the types of events CloudTrail will capture
  event_selector {
    read_write_type           = var.event_read_write_type     # Specifies whether to track read, write, or all events
    include_management_events = var.include_management_events # Determines if management events are logged
  }
}
