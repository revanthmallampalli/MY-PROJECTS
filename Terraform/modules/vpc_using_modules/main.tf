provider "aws" {
  region = var.region
}

module "vpcmod" {
  source = "./modules"
  cidr_block = var.cidr_block
  vpc_name = var.vpc_name
  subnet_count = var.subnet_count
  vpc_id = var.vpc_id
}