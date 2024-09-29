resource "aws_launch_template" "web_instance_launch_template" {
  name_prefix   = var.aws_launch_template_name
  image_id      = var.aws_launch_template_image_id
  instance_type = var.aws_launch_template_instance_type
  key_name      = var.aws_launch_template_key_name

  network_interfaces {
    security_groups = var.aws_launch_template_security_group
    associate_public_ip_address = false
  }

  tag_specifications {
    resource_type = "instance"
    tags          = var.tags
  }
}

resource "aws_autoscaling_group" "web_asg" {
  name                      = var.aws_autoscaling_group_name
  max_size                  = var.asg_max_instance_size
  min_size                  = var.asg_min_instance_size
  desired_capacity          = var.asg_min_instance_size
  vpc_zone_identifier       = var.asg_group_vpc_zone_identifier
  launch_template {
    id      = aws_launch_template.web_instance_launch_template.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = var.asg_web_instance_name
    propagate_at_launch = true
  }
  dynamic "tag" {
    for_each = var.tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}

resource "aws_autoscaling_policy" "scale_out_policy" {
  name                   = "scale-out-policy"
  scaling_adjustment     = var.asg_instance_scaling_adjustment
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.web_asg.name
}

resource "aws_autoscaling_policy" "scale_in_policy" {
  name                   = "scale-in-policy"
  scaling_adjustment     = -var.asg_instance_scaling_adjustment
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.web_asg.name
}

resource "aws_cloudwatch_metric_alarm" "cpu_scale_out_alarm" {
  alarm_name                = "cpu-scale-out-alarm"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 120
  statistic                 = "Average"
  threshold                 = var.asg_group_cpu_scale_out_threshold_percentage
  alarm_actions             = [aws_autoscaling_policy.scale_out_policy.arn]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.web_asg.name
  }
}

resource "aws_cloudwatch_metric_alarm" "cpu_scale_in_alarm" {
  alarm_name                = "cpu-scale-in-alarm"
  comparison_operator       = "LessThanThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 120
  statistic                 = "Average"
  threshold                 = var.asg_group_cpu_scale_in_threshold_percentage
  alarm_actions             = [aws_autoscaling_policy.scale_in_policy.arn]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.web_asg.name
  }
}
