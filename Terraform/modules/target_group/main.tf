resource "aws_lb_target_group" "default" {
  for_each = { for tg in var.target_groups : tg.name => tg }

  name        = each.key
  port        = each.value.port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"

  health_check {
    path     = each.value.health_path
    protocol = "HTTP"
  }
}
