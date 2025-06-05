# Calling the security group module to define rules for web servers
module "web_sg" {
  source             = "./modules/security_group"       # Specifies the module path for security groups
  name               = "web-sg"                         # Security group name for identification
  description        = "Security group for web servers" # Provides context about what this SG protects
  vpc_id             = module.vpc.vpc_id                # References the VPC ID dynamically from the network module
  public_subnet_cidr = module.subnets.public_subnet_cidr
  default_tags       = local.default_tags

  # Define ingress rules for incoming traffic
  ingress_rules = [
    # Allow incoming HTTP traffic (port 80) from public subnet CIDRs
    { from_port = 80, to_port = 80, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },

    # Allow incoming HTTPS traffic (port 443) from public subnet CIDRs
    { from_port = 443, to_port = 443, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
  ]

  # Define egress rules for outbound traffic
  egress_rules = [
    # Allow unrestricted outbound traffic to any destination
    { from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"] }
  ]
}
