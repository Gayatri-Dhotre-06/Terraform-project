provider "aws" {
  region = "ap-south-1"
}

module "my_vpc" {
  source = "./Modules/vpc"

  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
}

module "my_subnet" {
  source = "./Modules/subnet"

  vpc_id            = module.my_vpc.vpc_id
  subnet_cidr       = var.subnet_cidr
  availability_zone = var.availability_zone
  subnet_name       = var.subnet_name
}

module "my_sg" {
  source  = "./Modules/security-group"
  vpc_id  = module.my_vpc.vpc_id
  sg_name = var.sg_name
}

module "ec2" {
  source = "./Modules/ec2"

  ami               = var.ami
  instance_type     = var.instance_type
  subnet_id         = module.my_subnet.subnet_id
  security_group_id = module.my_sg.security_group_id
  instance_name     = var.instance_name
}