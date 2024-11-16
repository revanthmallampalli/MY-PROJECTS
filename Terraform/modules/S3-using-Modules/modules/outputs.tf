output "aws_s3_bucket" {
  value = aws_s3_bucket.S3module.bucket
}

output "aws_dynamodb_table" {
  value = aws_dynamodb_table.Dynamotable.name
}