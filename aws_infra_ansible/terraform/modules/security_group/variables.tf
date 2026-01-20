variable "ssh_port" {
  description = "Port for SSH access"
  type        = number
  default     = 22
}

variable "vpc_id" {
  description = "VPC ID where the Security Group will be created"
  type        = string
}
