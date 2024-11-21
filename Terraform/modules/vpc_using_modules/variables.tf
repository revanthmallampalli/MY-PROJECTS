variable "region" {
  description = "Region of the AWS PROVIDER"
  type = string
}

variable "cidr_block" {
  description = "cidr block of the vpc"
  type = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type = string
}

variable "subnet_count" {
  description = "Value of the subnets"
  type = number
}

variable "vpc_id" {
  description = "ID of the VPC"
  type = string
}