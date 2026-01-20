resource "aws_key_pair" "ansible" {
  key_name   = var.key_pair_name
  public_key = file(var.public_key_path)
}

module "security_group" {
  source = "./modules/security_group"
}

module "ec2" {
  source             = "./modules/ec2"
  instance_type      = var.instance_type
  key_name           = aws_key_pair.ansible.key_name
  security_group_id  = module.security_group.sg_id
}
