# ================================
# AWS Subnet Module: Dynamic Subnet Creation
# ================================

# Creates public subnets dynamically based on the provided configuration map.
resource "aws_subnet" "public_subnets" {
  for_each = var.public_subnet_configs # Loops over each public subnet definition.

  vpc_id                  = var.vpc_id                   # Associates subnets with the main VPC.
  cidr_block              = each.value.cidr_block        # Defines subnet range.
  availability_zone       = each.value.availability_zone # Ensures distribution across AZs.
  map_public_ip_on_launch = true                         # Public subnets allow instances to receive public IPs.

  # Tags ensure each subnet is identifiable and categorized appropriately.
  tags = merge(var.default_tags, {
    Name = "${var.default_tags.Project}-${var.default_tags.Environment}-${try(each.value.layer_name, "default")}-${each.value.availability_zone}-public-subnet"
    Type = "Public"
  })
}
# Creates private subnets dynamically based on the provided configuration map.
resource "aws_subnet" "private_subnets" {
  for_each = var.private_subnet_configs # Loops over each private subnet definition.

  vpc_id                  = var.vpc_id                   # Associates subnets with the main VPC.
  cidr_block              = each.value.cidr_block        # Defines subnet range.
  availability_zone       = each.value.availability_zone # Ensures distribution across AZs.
  map_public_ip_on_launch = false                        # Private subnets do not receive public IPs.

  # Tags ensure each subnet is identifiable and categorized appropriately.
  tags = merge(var.default_tags, {
    Name = "${var.default_tags.Project}-${var.default_tags.Environment}-${try(each.value.layer_name, "default")}-${each.value.availability_zone}-private-subnet"
    Type = "Private"
  })
}

