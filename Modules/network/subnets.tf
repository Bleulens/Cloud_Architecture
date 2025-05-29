# ================================
# AWS Subnet Module: Dynamic Subnet Creation
# ================================

# Creates public subnets dynamically based on the provided configuration map.
resource "aws_subnet" "public_subnets" {
  for_each = var.public_subnet_configs # Loops over each public subnet definition.

  vpc_id                  = aws_vpc.main.id              # Associates subnets with the main VPC.
  cidr_block              = each.value.cidr_block        # Defines subnet range.
  availability_zone       = each.value.availability_zone # Ensures distribution across AZs.
  map_public_ip_on_launch = true                         # Public subnets allow instances to receive public IPs.

  # Tags ensure each subnet is identifiable and categorized appropriately.
  tags = merge(var.default_tags, {
    Name = "Public-Subnet-${each.key}" # Dynamically names each public subnet.
    Type = "Public"                    # Explicitly marks the subnet as public.
  })
}

# Creates private subnets dynamically based on the provided configuration map.
resource "aws_subnet" "private_subnets" {
  for_each = var.private_subnet_configs # Loops over each private subnet definition.

  vpc_id                  = aws_vpc.main.id              # Associates subnets with the main VPC.
  cidr_block              = each.value.cidr_block        # Defines subnet range.
  availability_zone       = each.value.availability_zone # Ensures distribution across AZs.
  map_public_ip_on_launch = false                        # Private subnets do not receive public IPs.

  # Tags ensure each subnet is identifiable and categorized appropriately.
  tags = merge(var.default_tags, {
    Name = "Private-Subnet-${each.key}" # Dynamically names each private subnet.
    Type = "Private"                    # Explicitly marks the subnet as private.
  })
}
