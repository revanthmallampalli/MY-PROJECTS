provider "aws" {
  region = "us-east-1"
}

variable "environment" {
  description = "Environment type"
  default = "dev"
}
resource "aws_instance" "countinstance" {
  count = var.environment == "dev" ? 1:0
  ami = "ami-0cb19cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "dev-instance"
  }
}
