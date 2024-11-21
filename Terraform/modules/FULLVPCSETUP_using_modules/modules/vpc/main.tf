resource "aws_vpc" "vpcfull" {
  cidr_block = var.cidr_block
  enable_dns_hostnames = var.hostnames
  enable_dns_support = var.support

  tags = {
    Name = var.vpcname
  }
}

resource "aws_internet_gateway" "ig" {
  vpc_id = var.vpc_id

tags = {
  Name = "${var.vpcname}-igw"
}
}

resource "aws_route_table" "rt" {
  vpc_id = var.vpc_id
  tags = {
    Name ="${var.vpcname}-public-rt"
  }
}

resource "aws_route" "route" {
  route_table_id = aws_route_table.rt
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.ig.id
}

resource "aws_route_table_association" "rta" {
  count = length(var.public_subnets)
  subnet_id = element(var.public_subnets,count.index)
  route_table_id = aws_route_table.rt.id
}

output "vpcname" {
  value = var.vpcname
}