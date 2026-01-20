# Création du VPC
resource "aws_vpc" "devops_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name    = "devops-vpc"
    Project = "devops-squad"
  }
}

# Création d'un subnet public
resource "aws_subnet" "devops_subnet" {
  vpc_id            = aws_vpc.devops_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "${var.aws_region}a"

  tags = {
    Name    = "devops-subnet"
    Project = "devops-squad"
  }
}

# Création d'une gateway Internet
resource "aws_internet_gateway" "devops_igw" {
  vpc_id = aws_vpc.devops_vpc.id

  tags = {
    Name    = "devops-igw"
    Project = "devops-squad"
  }
}

# Table de routage publique
resource "aws_route_table" "devops_route_table" {
  vpc_id = aws_vpc.devops_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.devops_igw.id
  }

  tags = {
    Name    = "devops-rt"
    Project = "devops-squad"
  }
}

# Association du subnet à la route table
resource "aws_route_table_association" "devops_subnet_assoc" {
  subnet_id      = aws_subnet.devops_subnet.id
  route_table_id = aws_route_table.devops_route_table.id
}
