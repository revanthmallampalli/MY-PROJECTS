variable "vpc_id" {
  description = "ID of the vpc"
  type = string
}
variable "subnet_cidr" {
  description = "CIDR of the subnets"
  type = list(string)
}
variable "availability_zone" {
  description = "AZ of the subnets"
  type = list(string)
}
variable "subnet_type" {
  description = "type of the subnet"
  type = string
}