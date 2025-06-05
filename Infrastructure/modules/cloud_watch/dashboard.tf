# Defines an AWS CloudWatch Dashboard
# Dashboards provide a visual representation of metrics and logs for monitoring infrastructure health
resource "aws_cloudwatch_dashboard" "main" {

  # Name of the CloudWatch Dashboard
  # Used to identify and manage dashboards in the AWS Console
  dashboard_name = var.dashboard_name

  # JSON-encoded body of the dashboard, defining widgets and their configurations
  dashboard_body = jsonencode({
    widgets = [
      {
        # Metric widget displaying EC2 CPU utilization
        type   = "metric"
        x      = var.metric_x      # X-axis position on the dashboard grid
        y      = var.metric_y      # Y-axis position on the dashboard grid
        width  = var.metric_width  # Width of the widget in grid units
        height = var.metric_height # Height of the widget in grid units

        properties = {
          # Defines the metric and dimensions for visualization
          metrics = [
            [
              "AWS/EC2",       # AWS namespace for EC2 metrics
              var.metric_name, # Metric being tracked (e.g., CPU utilization)
              "InstanceId",    # Dimension for filtering the metric
              var.instance_id  # Target EC2 instance ID
            ]
          ]
          period = var.metric_period # Time period for metric aggregation (in seconds)
          stat   = var.metric_stat   # Aggregation method (e.g., Average, Sum, Maximum)
          region = var.aws_region    # AWS region where the instance resides
          title  = var.metric_title  # Display title for the widget
        }
      },
      {
        # Text widget displaying static content using Markdown
        type   = "text"
        x      = var.text_x      # X-axis position on the dashboard grid
        y      = var.text_y      # Y-axis position on the dashboard grid
        width  = var.text_width  # Width of the text widget
        height = var.text_height # Height of the text widget

        properties = {
          markdown = var.text_content # Markdown-formatted content for display
        }
      }
    ]
  })
}
