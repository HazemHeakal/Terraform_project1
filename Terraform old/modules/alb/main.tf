resource "aws_lb" "alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.vpc_security_group_ids
  subnets            = var.subnet_id

  tags = var.tags
}

resource "aws_lb_target_group" "alb_target_group" {
  name        = "${var.alb_name}-tg"
  port        = var.listener_port
  protocol    = var.listener_protocol
  vpc_id      = var.vpc_id
  target_type = "instance"

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 10
    timeout             = 5
    interval            = 15
    path                = "/health"
    port                = "traffic-port"
    matcher             = "200"
  }

  tags = var.tags
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = var.listener_port
  protocol          = var.listener_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}

resource "aws_lb_target_group_attachment" "alb_target_group_attachment" {
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id        = var.target_id
  port             = var.listener_port
}
