resource "aws_lb_listener" "https_listener" {
  load_balancer_arn = var.lb_arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.cert_arn

  # Default action if no rules match
  default_action {
    type = "forward"
    target_group_arn = var.target_group_arns["occ-dev-us-east-1-lb-alb-tg"]
  }
}

resource "aws_lb_listener_rule" "https_listener_rules" {
  for_each = { for rule in var.listener_rules : rule.priority => rule }

  listener_arn = aws_lb_listener.https_listener.arn
  priority     = each.value.priority

  condition {
    host_header {
      values = [each.value.host_header]
    }
  }

  action {
    type             = "forward"
    target_group_arn = var.target_group_arns[each.value.tg_name]
  }
}
