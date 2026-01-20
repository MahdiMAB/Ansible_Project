output "public_ips" {
  description = "Public IPs of EC2 instances"
  value       = aws_instance.devops[*].public_ip
}

output "private_ips" {
  description = "Private IPs of EC2 instances"
  value       = aws_instance.devops[*].private_ip
}

output "instance_ids" {
  description = "IDs of EC2 instances"
  value       = aws_instance.devops[*].id
}
