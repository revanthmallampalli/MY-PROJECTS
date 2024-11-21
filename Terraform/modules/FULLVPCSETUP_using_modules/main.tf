provider "aws" {
  region = var.region
}

module "vpcmodule" {
  source = "./modules/vpc"
  cidr_block = var.cidr_block
  #subnets = var.subnets
  public_subnets = var.public_subnets
  hostnames = var.hostnames
  support = var.support
  vpcname = var.vpcname
  vpc_id = var.vpc_id
}
module "subnetmodule" {
  source = "./modules/subnets"
vpc_id = var.vpc_id
subnet_cidr = var.subnet_cidr
subnet_type = var.subnet_type
availability_zone = var.availability_zone
}
module "securitygroup" {
  source = "./modules/securitygroups"
  sgname = var.sgname
  vpc_id = var.vpc_id
  sgnameoutput = var.sgnameoutput
}