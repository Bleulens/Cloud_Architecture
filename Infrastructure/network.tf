# ---------------------------------------
# Call the VPC Module
# ---------------------------------------
module "vpc" {
  source       = "./modules/vpc" # ✅ Path to your network module
  default_tags = local.default_tags
}

# ---------------------------------------
# Public and Private Subnets
# ---------------------------------------
module "subnets" {
  source                 = "./modules/subnets"
  vpc_id                 = module.vpc.vpc_id
  public_subnet_configs  = var.public_subnet_configs
  private_subnet_configs = var.private_subnet_configs
  default_tags           = local.default_tags
}

# ---------------------------------------
# Internet Gateway
# ---------------------------------------
module "igw" {
  source       = "./modules/internet_gateway"
  vpc_id       = module.vpc.vpc_id
  default_tags = local.default_tags
}

# ---------------------------------------
# Public Route Table
# ---------------------------------------
module "public_routing" {
  source                = "./modules/public_route_table"
  vpc_id                = module.vpc.vpc_id
  public_subnet_ids     = module.subnets.public_subnet_ids
  public_subnet_configs = var.public_subnet_configs
  igw_id                = module.igw.internet_gateway_id
  default_tags          = local.default_tags
}

# ---------------------------------------
# NAT Gateway
# ---------------------------------------
module "nat_gateway" {
  source                        = "./modules/nat_gateway" # Make sure this path is correct
  create_nat_gateway            = var.create_nat_gateway
  nat_subnet_id_for_nat_gateway = module.subnets.public_subnet_ids["subnet1"] # Choose ONE public subnet for the NAT GW (e.g., the first one)
  default_tags                  = local.default_tags
}

# ---------------------------------------
# Private Route Table
# ---------------------------------------
module "private_routing" {
  source                 = "./modules/private_route_table"
  vpc_id                 = module.vpc.vpc_id
  private_subnet_ids     = module.subnets.private_subnet_ids
  private_subnet_configs = var.private_subnet_configs # <--- Add this line
  nat_gateway_id         = module.nat_gateway.nat_gateway_id
  default_tags           = local.default_tags
}

