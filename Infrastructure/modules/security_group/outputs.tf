# Define outputs for the security group module
# These allow other resources to reference attributes of the security group

output "security_group_id" {
  description = "The ID of the created security group" # Useful for attaching to instances or other resources
  value       = aws_security_group.this.id             # References the SG ID from the main module file
}

output "security_group_name" {
  description = "The name of the security group" # Helps keep track of SG identifiers in infrastructure automation
  value       = aws_security_group.this.name
}
