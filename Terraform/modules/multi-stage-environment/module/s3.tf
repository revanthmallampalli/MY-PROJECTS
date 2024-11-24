resource "aws_s3_bucket" "multistagebucket" {
  bucket = var.bucketname
  #acl = "private"

  tags = {
    Name = var.bucketname
    Environment ="Terraform"
  }

}