
variable "cidr_block" {
  description = "CIDR of VPC"
  type = string
}
variable "state" {
  
}
variable "hostnames" {
  description = "hostnames of the CIDR"
  type = bool
}
variable "support" {
  description = "support of the CIDR"
  type = bool
}
variable "vpcname" {
  description = "Name of the vpc"
  type = string
}
variable "vpcid" {
  description = "ID of the vpc"
  type = string
}
variable "subnetcount" {
  description = "Count of the subnet"
  type = number
}