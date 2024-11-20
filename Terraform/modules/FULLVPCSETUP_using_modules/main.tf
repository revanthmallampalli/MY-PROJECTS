provider "aws" {
  region = var.region
}

module "vpcmodule" {
  source = "./modules/VPC"
  cidr_block = var.cidr_block
  subnets = var.subnets
  hostnames = var.hostnames
  support = var.support
  vpcname = var.vpcname
}
module "subnetmodule" {
  source = "./modules/SUBNETS"
vpc_id = var.vpc_id
subnet_cidr = var.subnet_cidr
subnet_type = var.subnet_type
availability_zone = var.availability_zone
}
module "securitygroup" {
  source = "./modules/SECURITY-GROUPS"
  sgname = var.sgname
  vpc_id = var.vpc_id
  sgnameoutput = var.sgnameoutput
}