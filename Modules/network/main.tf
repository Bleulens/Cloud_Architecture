# Create a VPC
# This defines the primary network environment where all resources will be deployed.
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block # Uses the specified CIDR block to define VPC boundaries.
}

# Create subnets dynamically based on the provided configuration map.
resource "aws_subnet" "dynamic_subnets" {
  for_each = var.subnet_configs # Iterates through the map of subnets.

  vpc_id                  = aws_vpc.main.id              # Associates the subnet with the main VPC.
  cidr_block              = each.value.cidr_block        # Defines the subnet's range based on the map values.
  availability_zone       = each.value.availability_zone # Deploys subnet in the specified AWS AZ.
  map_public_ip_on_launch = each.value.is_public         # Determines whether instances in this subnet get a public IP.

  # Combines the standard tags from var.default_tags with a dynamic Name tag
  # Each subnet gets a unique name formatted as "Subnet-<key>" based on its identifier
  tags = merge(var.default_tags, {
    Name = "Subnet-${each.key}"
  })

}
