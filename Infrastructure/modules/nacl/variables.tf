variable "vpc_id" {
  type        = string
  description = "VPC ID to associate with the Network ACL"
}

variable "name" {
  type        = string
  description = "Name of the Network ACL resource"
}

variable "default_tags" {
  description = "Tags for tracking the network ACL"
  type        = map(string)
}

variable "ingress_rules" {
  description = "List of ingress rule objects"
  type = list(object({
    rule_number = number
    protocol    = string
    cidr_block  = string
    from_port   = number
    to_port     = number
    rule_action = string
  }))
  default = []
}

variable "egress_rules" {
  description = "List of egress rule objects"
  type = list(object({
    rule_number = number
    protocol    = string
    cidr_block  = string
    from_port   = number
    to_port     = number
    rule_action = string
  }))
  default = []
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnets to associate with this NACL"
  default     = []
}
