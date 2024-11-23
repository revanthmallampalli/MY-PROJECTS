resource "aws_security_group" "name" {
  name = "${var.albname}-sg"
  vpc_id = var.vpcid

  ingress {
    from_port = var.listenerport
    to_port = var.listenerport
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_lb" "lb" {
  name = var.albname
  load_balancer_type = "application"
  security_groups = [aws_security_group.name.id]
  subnets = var.subnetids

  tags = {
    Name = var.albname
  }
}

resource "aws_lb_target_group" "albtg" {
  name = var.tgname
  port = var.listenerport
  protocol = "HTTP"
  vpc_id = var.vpcid

  health_check {
    path = var.health_check_path
    protocol = "HTTP"
    interval = 30
    timeout = 5
    healthy_threshold = 3
    unhealthy_threshold = 3
  }
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.lb.arn
  port = var.listenerport
  protocol = "HTTP"

  default_action {
    type ="forward"
    target_group_arn = aws_lb_target_group.albtg.arn
  }
}

output "alb_dns_name" {
  value = aws_lb.lb.dns_name
}