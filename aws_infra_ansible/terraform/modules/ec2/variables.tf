variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "Key pair name for SSH"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID to attach to instances"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where EC2 instances will be launched"
  type        = string
}
