# Defines an AWS CloudWatch Log Metric Filter
# This resource monitors log events and transforms them into CloudWatch metrics
resource "aws_cloudwatch_log_metric_filter" "metric_filter" {

  # The name assigned to the log metric filter
  # Used to identify and reference the filter within CloudWatch
  name = var.metric_filter_name

  # The pattern that log events must match to trigger the metric transformation
  # Typically a JSON or regex pattern to capture specific log messages
  pattern = var.metric_filter_pattern

  # The CloudWatch Log Group that contains the logs being analyzed
  # Must reference an existing log group within your infrastructure
  log_group_name = var.log_group_name

  # Defines how log events are transformed into metrics
  metric_transformation {

    # The name of the resulting CloudWatch metric
    name = var.metric_transformation_name

    # The namespace under which the transformed metric is categorized
    # Helps organize metrics within CloudWatch dashboards
    namespace = var.metric_transformation_namespace

    # The numeric value assigned to the metric each time a matching log event occurs
    # Often set to "1" for simple event counting
    value = var.metric_transformation_value
  }
}
