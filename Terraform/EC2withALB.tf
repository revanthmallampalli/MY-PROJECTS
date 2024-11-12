
provider "aws" {
    region = "us-east-1"
  }
  
  resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true
  
    tags ={
      Name="MYVPC"
    }
  }
  
  resource "aws_subnet" "mysubnet" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true
  
    tags = {
      Name = "MYSUBNET"
    }
  }
  
  resource "aws_internet_gateway" "myig" {
      vpc_id = aws_vpc.myvpc.id
  
      tags = {
        Name = "MYIG"
      }
  }
  
  resource "aws_security_group" "mysg" {
      name = "my-sg"
      description = "Allows inbound SSH and HTTP"
  
      ingress {
          from_port = 22
          to_port = 22
          protocol = "tcp"
          cidr_blocks = ["0,0,0,0/0"]
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
          cidr_blocks = [0,0,0,0/0]
      }
  }
  
  resource "aws_instance" "my_instance" {
    ami = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.mysubnet.id
    security_groups = [aws_security_group.mysg.name]
  
    associate_public_ip_address = true
  
    tags = {
      Name ="MYEC2"
    }
  
     user_data = <<-EOT
                #!/bin/bash
                yum update -y
                yum install -y httpd
                service httpd start
                chkconfig httpd on
                echo "Hello from EC2" > /var/www/html/index.html
                EOT
  }

resource "aws_lb" "myalb" {
  name               = "my-app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups   = [aws_security_group.mysg.name]
  subnets            = [aws_subnet.mysubnet.id]

  enable_deletion_protection = false

  tags = {
    Name = "MyAppLoadBalancer"
  }
}


resource "aws_lb_target_group" "mytg" {
  name     = "my-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.myvpc.id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "MyTargetGroup"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.myalb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "fixed-response"
    fixed_response {
      status_code = 200
      message_body = "Welcome to My Load Balanced App!"
      content_type = "text/plain"
    }
  }
}

resource "aws_lb_target_group_attachment" "tg_attachment" {
  target_group_arn = aws_lb_target_group.mytg.arn
  target_id       = aws_instance.my_instance.id
  port            = 80
}