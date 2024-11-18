provider "aws" {
  region = var.region
}

module "ec2" {
  source = "./modules"
  ami = var.ami
  type = var.type
  sgname = var.sgname
  Name = var.name
}