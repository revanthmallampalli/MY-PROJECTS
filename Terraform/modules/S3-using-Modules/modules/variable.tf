variable "bucketname" {
  description = "Name of the bucket"
  type = string
}
variable "versioning" {
  description ="Versioning of the S3"
  type = bool
  default = false
}
variable "table_name" {
  description = "Name of the dynamo table"
  type = string
}