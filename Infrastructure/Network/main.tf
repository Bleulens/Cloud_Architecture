# ---------------------------------------
# Call the VPC Module
# ---------------------------------------
module "vpc" {
  source         = "../modules/network/vpc" # ✅ Path to your network module
  vpc_cidr_block = var.vpc_cidr_block
}

# ---------------------------------------
# Call the Subnet Module
# ---------------------------------------
module "subnets" {
  source         = "../modules/network/subnets" # ✅ Path to subnets module
  vpc_id         = module.vpc.vpc_id
  subnet_configs = var.subnet_configs
}

# ---------------------------------------
# Call the Routing Module
# ---------------------------------------
module "routing" {
  source        = "../modules/network/route_tables" # ✅ Path to routing module
  vpc_id        = module.vpc.vpc_id
  route_entries = var.route_entries
}
