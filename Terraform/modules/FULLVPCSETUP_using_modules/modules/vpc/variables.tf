variable "cidr_block" {
  description = "CIDR block of vpc"
  type = string
}
variable "hostnames" {
  description = "hostanme of the VPC"
  type = bool
}
variable "support" {
  description = "support of vps"
  type = bool
}
variable "vpcname" {
  description = "name of the VPC"
  type = string
}
variable "vpc_id" {
  description = "ID of the vpc"
  type = string
}
variable "public_subnets" {
  description = "Public subnets"
  type = list(string)
}