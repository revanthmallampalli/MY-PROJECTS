resource "aws_vpc" "mvpc" {
  cidr_block = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "vpcsubnet" {
  count = var.subnet_count #The count.index value allows you to create different resources per index.
  vpc_id = var.vpc_id
  cidr_block = cidrsubnet(var.cidr_block, 8,count.index) #Uses cidrsubnet() to calculate the CIDR block for each subnet. The 8 here indicates how much to divide the CIDR block,
                             # and count.index ensures each subnet gets a different subnet range based on its index.
  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Name = "${var.vpc_name}-subnet -${count.index}"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

output "subnet_ids" {
    value = aws_subnet.vpcsubnet[*].id
}