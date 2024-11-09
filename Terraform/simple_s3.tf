provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "mys3bucket" {
  bucket = "my-simple-s3-bucket"
}