resource "aws_s3_bucket" "S3module" {
  bucket = var.bucketname
 // acl = var.acl

  versioning {
    enabled = var.versioning
  }
}
resource "aws_dynamodb_table" "Dynamotable" {
  name = var.table_name
  hash_key = "LOCK_ID"
  read_capacity = 5
  write_capacity = 5

  attribute {
    name = "LOCK_ID"
    type = "S"
  }

  billing_mode = "PROVISONED"
}
