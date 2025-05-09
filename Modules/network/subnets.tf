# ================================
# AWS Subnet Module: Dynamic Subnet Creation
# ================================

# Creates subnets dynamically based on the provided configuration map.
resource "aws_subnet" "dynamic_subnets" {
  for_each = var.subnet_configs # Iterates through the map of subnet definitions.

  vpc_id                  = aws_vpc.main.id              # Associates the subnet with the main VPC.
  cidr_block              = each.value.cidr_block        # Defines the subnet’s range based on provided map values.
  availability_zone       = each.value.availability_zone # Deploys the subnet in the specified AWS Availability Zone.
  map_public_ip_on_launch = each.value.is_public         # Controls whether instances launched in this subnet get a public IP.

  # Tags ensure clear identification of subnets and their purpose.
  # Each subnet is dynamically named and categorized as Public or Private.
  tags = merge(var.default_tags, {
    Name = "Subnet-${each.key}"                        # Creates a unique name formatted as "Subnet-<key>"
    Type = each.value.is_public ? "Public" : "Private" # Explicitly tags subnets as Public or Private.
  })
}
