# Calling the security group module to define rules for web servers
module "web_sg" {
  source      = "../../modules/security-group"   # Specifies the module path for security groups
  name        = "web-sg"                         # Security group name for identification
  description = "Security group for web servers" # Provides context about what this SG protects
  vpc_id      = module.network.vpc_id            # References the VPC ID dynamically from the network module

  # Define ingress rules for incoming traffic
  ingress_rules = [
    # Allow incoming HTTP traffic (port 80) from public subnet CIDRs
    { from_port = 80, to_port = 80, protocol = "tcp", cidr_blocks = [module.network.public_subnet_cidr] },

    # Allow incoming HTTPS traffic (port 443) from public subnet CIDRs
    { from_port = 443, to_port = 443, protocol = "tcp", cidr_blocks = [module.network.public_subnet_cidr] }
  ]

  # Define egress rules for outbound traffic
  egress_rules = [
    # Allow unrestricted outbound traffic to any destination
    { from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"] }
  ]
}
