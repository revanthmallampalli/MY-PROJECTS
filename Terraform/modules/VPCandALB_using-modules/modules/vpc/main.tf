resource "aws_vpc" "name" {
  cidr_block = var.cidr_block
  enable_dns_hostnames = var.hostnames
  enable_dns_support = var.support

  tags = {
    Name = var.vpcname
  }
}

resource "aws_internet_gateway" "ig" {
  vpc_id = var.vpcid

  tags = {
    Name = "${var.vpcname}-ig"
  }
}

resource "aws_subnet" "subnet" {
  count = var.subnetcount
  vpc_id = var.vpcid
  cidr_block = cidrsubnet(var.cidr_block,8,count.index)
  availability_zone = element(data.aws_availability_zone.azone,count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-${count.index}"
  }
}

data "aws_availability_zone" "azone" {
  state = "available"
  }

output "vpcid" {
  value = var.vpcid
}

output "subnetids" {
  value = aws_subnet.subnet[*].id
}
