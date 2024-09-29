# Web Instance auto scaling group
module "web_instance_asg" {
  source = "./modules/asg"

  aws_launch_template_name                     = var.web_instance_launch_template_name
  aws_launch_template_image_id                 = var.web_instance_ami
  aws_launch_template_instance_type            = var.web_instance_type
  aws_launch_template_key_name                 = var.aws_ssh_key_pair
  aws_launch_template_security_group           = var.web_security_group_id
  asg_max_instance_size                        = var.web_instance_asg_max_instance_size
  asg_min_instance_size                        = var.web_instance_asg_min_instance_size
  asg_instance_scaling_adjustment              = var.web_instance_scaling_adjustment
  aws_autoscaling_group_name                   = var.aws_autoscaling_group_name
  asg_group_cpu_scale_out_threshold_percentage = var.web_instance_asg_group_cpu_scale_out_threshold_precentage
  asg_group_cpu_scale_in_threshold_percentage  = var.web_instance_asg_group_cpu_scale_in_threshold_precentage
  asg_group_vpc_zone_identifier                = var.web_private_subnet_ids
  asg_web_instance_name                        = var.asg_web_instance_name
  tags                                         = var.tags
}

# Application load balancer
module "alb" {
  source = "./modules/alb"

  alb_name               = var.alb_name
  vpc_security_group_ids = var.lb_security_group_id
  vpc_id                 = var.alb_vpc_id
  target_id              = module.web_instance_asg.aws_autoscaling_group_id
  subnet_id              = var.lb_public_subnet_ids
  listener_port          = var.alb_listener_port
  listener_protocol      = var.alb_listener_protocol
  alb_idle_timeout       = var.alb_idle_timeout
  tags                   = var.tags
}
