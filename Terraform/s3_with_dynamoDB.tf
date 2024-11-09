provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "mys3withDB" {
  bucket = "my-S3-with-dynamoDb"
}

resource "aws_dynamodb_table" "tfstatelock" {
  name ="my-state-lock"
  hash_key = "LockID"
  read_capacity = 5
  write_capacity = 5

  attribute {
    name = "LockID"
    type = "S"
  }
}

terraform {
  backend "s3" {
    bucket = "my-S3-with-dynamoDb"
    key = "LockID"
    region = "us-east-1"
    encrypt = true
    dynamodb_table = "my-state-lock"
    acl = "private"
  }
}