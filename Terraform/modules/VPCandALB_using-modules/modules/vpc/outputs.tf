output "vpcido" {
  value = var.vpcid
}

output "subnetidso" {
  value = aws_subnet.subnet[*].id
}