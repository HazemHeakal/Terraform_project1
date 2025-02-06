output "target_group_arns" {
  value = { for name, tg in aws_lb_target_group.default : name => tg.arn }
}

output "target_group_names" {
  value = [for name in aws_lb_target_group.default : name]
}
