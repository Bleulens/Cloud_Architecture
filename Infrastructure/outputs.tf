# Output the selected AWS region
# Useful for verifying which region the infrastructure is deployed in.
output "aws_region" {
  description = "AWS region where resources are deployed"
  value       = var.aws_region
}
