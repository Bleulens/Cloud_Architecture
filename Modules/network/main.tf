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

  tags = {
    Name        = "Subnet-${each.key}" # Assigns a unique name to each subnet based on its key.
    Environment = var.environment      # Tags the subnet with its environment (e.g., Dev, Staging, Prod).
  }
}

# Reference the network module from the root module to manage VPC and subnets modularly.
module "network" {
  source         = "./modules/network" # Specifies the directory containing the network module.
  vpc_cidr_block = var.vpc_cidr_block  # Passes the VPC CIDR block variable to the module.
  subnet_configs = var.subnet_configs  # Provides the subnet configuration map for dynamic creation.
}
