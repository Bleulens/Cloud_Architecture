variable "subnet_id" {
  description = "Public subnet ID for EC2 instances"
  type        = string
}

variable "instance_count" {
  description = "Number of EC2 instances to deploy"
  type        = number
}
