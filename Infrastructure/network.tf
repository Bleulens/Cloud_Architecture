# ---------------------------------------
# Call the VPC Module
# ---------------------------------------
module "vpc" {
  source         = "../modules/network/vpc" # ✅ Path to your network module
  vpc_cidr_block = var.vpc_cidr_block
}

# ---------------------------------------
# Public and Private Subnets
# ---------------------------------------
module "public_subnets" {
  source         = "../modules/network/subnets"
  vpc_id         = module.vpc.vpc_id
  subnet_configs = var.public_subnet_configs # ✅ Define public subnet CIDRs
}

# ---------------------------------------
# Public Route Table
# ---------------------------------------
module "public_routing" {
  source        = "../modules/network/route_tables"
  vpc_id        = module.vpc.vpc_id
  subnet        = module.subnets.public_subnet_ids
  route_entries = var.route_entries # ✅ Define public routes
}

# ---------------------------------------
# Private Route Table
# ---------------------------------------
module "private_routing" {
  source        = "../modules/network/route_tables"
  vpc_id        = module.vpc.vpc_id
  subnet        = module.subnets.private_subnet_ids
  route_entries = var.route_entries # ✅ Define private routes
}

# ---------------------------------------
# Internet Gateway
# ---------------------------------------
module "igw" {
  source = "../modules/network/internet_gateway"
  vpc_id = module.vpc.vpc_id
}
