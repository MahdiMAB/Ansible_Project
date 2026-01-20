# Création de la clé SSH
resource "aws_key_pair" "ansible" {
  key_name   = var.key_pair_name
  public_key = file(var.public_key_path)
}

# Module réseau
module "networking" {
  source     = "./modules/networking"
  aws_region = var.aws_region
}

# Module Security Group
module "security_group" {
  source = "./modules/security_group"
}

# Module EC2
module "ec2" {
  source            = "./modules/ec2"
  instance_type     = var.instance_type
  key_name          = aws_key_pair.ansible.key_name
  security_group_id = module.security_group.sg_id
  subnet_id         = module.networking.subnet_id
}
