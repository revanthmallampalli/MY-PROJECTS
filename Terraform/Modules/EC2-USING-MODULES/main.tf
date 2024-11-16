provider "aws" {
  region = "us-east-1"
}

module "ec2" {
  source = "./modules/ec2_instance"
  ami = var.ami
  instance_type = var.instance_type
  name = var.name
}