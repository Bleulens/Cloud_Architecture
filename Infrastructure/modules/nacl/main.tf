resource "aws_network_acl" "this" {
  vpc_id = var.vpc_id
  tags   = merge(var.default_tags, { Name = var.name })
}

resource "aws_network_acl_rule" "ingress" {
  count          = length(var.ingress_rules)
  network_acl_id = aws_network_acl.this.id

  rule_number = var.ingress_rules[count.index].rule_number
  protocol    = var.ingress_rules[count.index].protocol
  rule_action = var.ingress_rules[count.index].rule_action
  egress      = false
  cidr_block  = var.ingress_rules[count.index].cidr_block
  from_port   = var.ingress_rules[count.index].from_port
  to_port     = var.ingress_rules[count.index].to_port
}

resource "aws_network_acl_rule" "egress" {
  count          = length(var.egress_rules)
  network_acl_id = aws_network_acl.this.id

  rule_number = var.egress_rules[count.index].rule_number
  protocol    = var.egress_rules[count.index].protocol
  rule_action = var.egress_rules[count.index].rule_action
  egress      = true
  cidr_block  = var.egress_rules[count.index].cidr_block
  from_port   = var.egress_rules[count.index].from_port
  to_port     = var.egress_rules[count.index].to_port
}

resource "aws_network_acl_association" "this" {
  count          = length(var.subnet_ids)
  network_acl_id = aws_network_acl.this.id
  subnet_id      = var.subnet_ids[count.index]
}
