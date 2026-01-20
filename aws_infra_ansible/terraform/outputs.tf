output "ec2_public_ips" {
  description = "Public IPs of EC2 instances"
  value       = module.ec2.public_ips
}

output "ec2_private_ips" {
  description = "Private IPs of EC2 instances"
  value       = module.ec2.private_ips
}

output "ec2_instance_ids" {
  description = "IDs of EC2 instances"
  value       = module.ec2.instance_ids
}

output "vpc_id" {
  description = "VPC ID created"
  value       = module.networking.vpc_id
}

output "subnet_id" {
  description = "Subnet ID created"
  value       = module.networking.subnet_id
}

output "security_group_id" {
  description = "Security Group ID created"
  value       = module.security_group.sg_id
}
