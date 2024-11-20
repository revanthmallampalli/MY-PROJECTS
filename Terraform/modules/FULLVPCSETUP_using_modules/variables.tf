variable "region" {
  description = "Region of the provider"
  type = string
}
variable "cidr_block" {
  description = "CIDR block of VPC"
  type = string
}
variable "hostnames" {
  description = "Set the value to hostname"
  type = bool
}
variable "support" {
  description = "set the value to support"
  type = bool
}
variable "vpcname" {
  description = "Name of the VPC"
  type = string
}
variable "subnets" {
  description = "Name of subnets"
  type = list(string)
}
variable "vpc_id" {
  description = "ID of the VPC"
  type = string
}
variable "subnet_cidr" {
  description = "List of cidr blocks for the subnets"
  type = list(string)
}
variable "availability_zone" {
  description = "List of avialability zone for the subnets"
  type = list(string)
}
variable "subnet_type" {
  description = "type of the subnet"
  type = string
}
variable "sgname" {
  description = "Name of the SG"
  type = string
}
variable "sgnameoutput" {
  description = "Name of the SG output"
}