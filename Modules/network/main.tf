# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block # Placeholder: Uses default if not explicitly set
}

# Create a public subnet inside the VPC
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidr_block # Placeholder: Uses default unless overridden
  map_public_ip_on_launch = true                  # Ensures instances in this subnet get public IPs
  availability_zone       = var.availability_zone # Placeholder: Can be changed per environment
}

# Create a private subnet inside the VPC
resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24" # Adjust as needed
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = false # Prevents automatic public IP assignment
  tags = {
    Name = "Private Subnet"
  }
}
