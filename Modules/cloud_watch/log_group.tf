# Creates an AWS CloudWatch Log Group with a dynamic name and retention period.
# The 'name' and 'retention_in_days' values are provided via variables for modularity.
# Tags are assigned from 'default_tags' to ensure consistency across all resources.
resource "aws_cloudwatch_log_group" "example" {
  name              = var.log_group_name
  retention_in_days = var.retention_days

  tags = var.default_tags
}
