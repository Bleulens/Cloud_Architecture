# Output the ID of the created VPC
# This ID uniquely identifies the VPC in AWS, useful for linking other resources to it.
output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.main.id
}

# Output the ID of the public subnet
# Used when associating resources like EC2 instances that need internet access.
output "subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public_subnet.id
}

# Output the ID of the private subnet
# Helps link internal resources that do not need direct internet access.
output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = aws_subnet.private_subnet.id
}

# Output the CIDR block of the VPC
# Displays the range of IP addresses allocated for the VPC.
output "vpc_cidr_block" {
  description = "CIDR block of the created VPC"
  value       = aws_vpc.main.cidr_block
}

# Output the CIDR block of the public subnet
# Indicates which IPs are available for assignment in the public subnet.
output "public_subnet_cidr" {
  description = "CIDR block of the public subnet"
  value       = aws_subnet.public_subnet.cidr_block
}

# Output the CIDR block of the private subnet
# Indicates which IPs are available for assignment in the private subnet.
# Useful when setting up internal services, such as databases or backend servers.
output "private_subnet_cidr" {
  description = "CIDR block of the private subnet"
  value       = aws_subnet.private_subnet.cidr_block
}

# Output the ID of the Internet Gateway
# Identifies the gateway used for enabling internet access in the VPC.
output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.igw.id
}
