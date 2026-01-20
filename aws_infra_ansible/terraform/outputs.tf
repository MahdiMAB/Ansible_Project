output "ec2_public_ips" {
  description = "Public IPs of EC2 instances"
  value       = module.ec2.public_ips
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.networking.vpc_id
}

output "subnet_id" {
  description = "Subnet ID"
  value       = module.networking.subnet_id
}
