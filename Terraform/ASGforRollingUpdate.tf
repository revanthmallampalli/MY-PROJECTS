provider "aws" {
  region = "us-east-1"  # Change to your region
}

resource "aws_launch_template" "my_launch_template" {
  name = "my-app-launch-template"

  # Update AMI here with the new version of your application
  image_id      = "ami-0c55b159cbfafe1f0"  # Replace with your AMI ID
  instance_type = "t2.micro"

  lifecycle {
    create_before_destroy = true  # Allows replacement before destroying old template
  }

  # Add other configurations as required
}

resource "aws_autoscaling_group" "my_asg" {
  launch_template {
    id      = aws_launch_template.my_launch_template.id
    version = "$Latest"
  }

  min_size = 2
  max_size = 4
  desired_capacity = 2

  # Replace with your load balancer
  target_group_arns = [aws_lb_target_group.my_target_group.arn]

  # Enable instance refresh for rolling updates
  instance_refresh {
    strategy = "Rolling"
    
    preferences {
      min_healthy_percentage      = 50
      instance_warmup             = 300  # Time (seconds) to allow new instances to stabilize
      skip_matching               = true  # Skips updates if no change is detected
    }
    
    triggers = ["launch_configuration", "launch_template"]  # Triggers refresh if there is a change
  }
}

# Load balancer configuration for routing traffic to the instances
resource "aws_lb" "my_load_balancer" {
  name               = "my-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [aws_subnet.my_subnet1.id, aws_subnet.my_subnet2.id]
}

resource "aws_lb_target_group" "my_target_group" {
  name     = "my-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    enabled             = true
    interval            = 30
    path                = "/health"
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 2
  }
}

resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.my_asg.name
}

# Security groups, subnets, and other resources go here
resource "aws_security_group" "lb_sg" {
  
}

resource "aws_subnet" "my_subnet1" {
    vpc_id = aws_security_group.lb_sg.id
}

resource "aws_subnet" "my_subnet2" {
  vpc_id = aws_security_group.lb_sg.id
}
resource "aws_vpc" "main" {
  cidr_block ="10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
}
