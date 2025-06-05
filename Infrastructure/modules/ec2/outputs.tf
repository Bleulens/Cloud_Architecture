# Output instance IDs for reference in other modules
# Useful for attaching security groups or tracking deployments
output "instance_ids" {
  description = "List of deployed EC2 instance IDs"
  value       = aws_instance.instances[*].id
}

# Output public IPs for external access
# Ensures easy retrieval of public addresses for remote management
output "public_ips" {
  description = "Public IP addresses of deployed EC2 instances"
  value       = aws_instance.instances[*].public_ip
}
