variable "sgname" {
  description = "Name of the SG"
  type = string
}
variable "ami" {
  description = "AMI of the isntance"
  type = string
}
variable "name" {
  description = "Name of the VM"
  type = string
}
variable "type" {
  description = "Type of the Instance"
  type = string
}
variable "region" {
  description = "Region of the provider"
  type = string
}