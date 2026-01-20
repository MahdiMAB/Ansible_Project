resource "aws_security_group" "devops_sg" {
  name        = "devops-sg"
  description = "Security group for DevOps servers"
  vpc_id      = var.vpc_id  # <--- obligatoire pour être dans le bon VPC

  ingress {
    description = "SSH access"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Kubernetes API"
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "devops-sg"
    Project = "devops-squad"
  }
}
