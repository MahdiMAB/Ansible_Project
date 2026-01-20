output "ec2_public_ips" {
  description = "Public IPs of EC2 instances"
  value       = module.ec2.public_ips
}
