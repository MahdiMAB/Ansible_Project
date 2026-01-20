# Récupération de l'AMI Ubuntu la plus récente
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  owners = ["099720109477"]
}

# Création des instances EC2
resource "aws_instance" "devops" {
  count         = 3
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [var.security_group_id]

  # Pré-installation Python
  user_data = <<-EOF
              #!/bin/bash
              apt update && apt install -y python3 python3-pip
              EOF

  # Tags pour identification et gestion
  tags = {
    Name    = "devops-node-${count.index + 1}"
  }
}
