variable "cidr_block" {
  description = "Range of the VPC"
  type = string
}
variable "vpc_name" {
  description = "Name of the vpc"
  type = string
}

variable "subnet_count" {
  description = "Count of the subnet"
  type = number
}

variable "vpc_id" {
  description = "ID of the VPC"
  type = number
}