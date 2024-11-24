module "s3" {
  source = "../../module"
  region ="us-east-1"
  bucketname ="multistage-dev1bucket"
}