provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "ec2-sg" {
  name = "ec2-sg"
  description = "Allow inbound SSH and HTTP trafiic"

  ingress {
    from_port=22
    to_port=22
    protocol="tcp"
    cidr_blocks=["0,0,0,0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0,0,0,0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0,0,0,0/0"]
  }

}

resource "aws_instance" "myec2" {
    ami = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"

    security_groups = [aws_security_group.ec2-sg.name]

    associate_public_ip_address = true

    tags = {
      Name ="MyEC2INSTANCE"
    }
  
}