variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "subnet_id" {
  description = "ID of the subnet where EC2 instances will be launched"
  type        = string
}
