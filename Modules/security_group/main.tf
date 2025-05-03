# Define an AWS security group
# This resource creates a security group using variable inputs for modularity

resource "aws_security_group" "this" {
  name        = var.name        # Security group name, provided via a variable
  description = var.description # A brief description of what this SG is for
  vpc_id      = var.vpc_id      # Associate the SG with a specific VPC

  # Dynamically create ingress (incoming) rules
  # Each rule in var.ingress_rules is processed using a dynamic block
  dynamic "ingress" {
    for_each = var.ingress_rules # Loops through each ingress rule passed via the module input
    content {
      from_port   = ingress.value["from_port"]   # Defines the starting port for traffic
      to_port     = ingress.value["to_port"]     # Defines the ending port (can be same as from_port)
      protocol    = ingress.value["protocol"]    # Specifies the protocol (e.g., TCP, UDP, ICMP)
      cidr_blocks = ingress.value["cidr_blocks"] # Allows traffic from specific IP ranges
    }
  }

  # Dynamically create egress (outgoing) rules
  # Similar approach to ingress, looping over var.egress_rules
  dynamic "egress" {
    for_each = var.egress_rules # Loops through each egress rule passed via the module input
    content {
      from_port   = egress.value["from_port"]   # Defines the starting port for outgoing traffic
      to_port     = egress.value["to_port"]     # Defines the ending port (can be same as from_port)
      protocol    = egress.value["protocol"]    # Specifies the protocol (e.g., TCP, UDP, ICMP)
      cidr_blocks = egress.value["cidr_blocks"] # Restricts where outbound traffic is sent
    }
  }
}
