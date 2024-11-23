variable "region" {
  description = "Region of the vpc"
}
variable "albname" {
  description = "name of the ALB"
  type = string
}
variable "vpcid" {
  description = "ID of the VPC"
  type = string
}
variable "listenerport" {
  description = "Port of the listernerport"
  type = number
}
variable "subnetids" {
  description = "IDs of the subnet"
  type = list(string)
}
variable "health_check_path" {
  description = "Path of the health"
  type = string
  default = "/"
}
variable "tgname" {
  description = "Name of the TG"
  type = string
}
variable "cidr_block" {
  description = "CIDR of VPC"
  type = string
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
variable "subnetcount" {
  description = "Count of the subnet"
  type = number
}
