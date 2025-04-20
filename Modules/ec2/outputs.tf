# Output the IDs of all created instances
output "instance_ids" {
  description = "List of EC2 instance IDs"
  value       = aws_instance.instances[*].id
}

# Output the public IPs of instances (useful for SSH or external services)
output "public_ips" {
  description = "List of public IPs of the EC2 instances"
  value       = aws_instance.instances[*].public_ip
}

# Output private IPs (helpful for internal networking)
output "private_ips" {
  description = "List of private IPs of the EC2 instances"
  value       = aws_instance.instances[*].private_ip
}
