provider "aws" {
  region = var.region
}

module "VPCmodule" {
  source = "./modules/vpc"
  hostnames = var.hostnames
  support = var.support
  vpcid = var.vpcid
  vpcname = var.vpcname
  cidr_block = var.cidr_block
  subnetcount = var.subnetcount
  #state =var.state
}
module "ALBmodule" {
  source = "./modules/alb"
  albname = var.albname
  vpcid = var.vpcid
  listenerport = var.listenerport
  tgname = var.tgname
  subnetids = var.subnetids
}