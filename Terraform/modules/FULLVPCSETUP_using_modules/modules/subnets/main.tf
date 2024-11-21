resource "aws_subnet" "subnetfull" {
  vpc_id = var.vpc_id
  count = length(var.subnet_cidr) # Create as many subnets as there are availability zones
  cidr_block = element(var.subnet_cidr, count.index)  # Retrieve CIDR block by index
  availability_zone = element(var.availability_zone,count.index) # Assign AZ based on count.index
  map_public_ip_on_launch = var.subnet_type == "public"

  tags = {
    Name = "${var.subnet_type}-${count.index+1}"
  }
}

output "subnetname" {
  value = aws_subnet.subnetfull[*].arn
}