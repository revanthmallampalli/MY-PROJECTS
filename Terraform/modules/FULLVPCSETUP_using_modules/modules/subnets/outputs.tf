output "subnetnameout" {
  value = aws_subnet.subnetfull[*].arn
}