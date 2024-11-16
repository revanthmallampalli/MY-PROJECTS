provider "aws" {
  region = var.region
}

module "s3_bucket" {
  source = "./modules"
  bucketname =  var.bucketname
  table_name = var.table_name
}

terraform {
  backend "s3" {
    bucket = var.bucketname
    key = "LockID"
    region = var.region
    encrypt = true
    dynamodb_table = var.table_name
    }
}


