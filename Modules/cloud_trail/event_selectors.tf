# Configures CloudTrail event selectors to filter specific API activity
resource "aws_cloudtrail_event_selector" "event_selector" {
  trail_name = aws_cloudtrail.main.name # Associates this event selector with the CloudTrail resource

  # Defines which types of events to track
  read_write_type           = var.event_read_write_type     # Options: "ReadOnly", "WriteOnly", or "All"
  include_management_events = var.include_management_events # Tracks events related to account security and configuration
}
