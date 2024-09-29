# Variables

# Region
region = "us-east-1"

# Key Pair
aws_ssh_key_pair = "tillster-dev-us-east-1-keypair"

# Tags
tags = {
  Environment = "dev"
  Platform    = "tillster"
  Tenant      = "shared"
  Service     = "om"
  Purpose     = "om"
}

# Web instance ASG configuration
web_private_subnet_ids                                    = ["subnet-022338a03b4a0dd31", "subnet-02db307f14813ffd7"]
web_instance_ami                                          = "ami-0562851c7c2f478c5"
web_instance_type                                         = "t3.medium"
asg_web_instance_name                                     = "om-dev-use1-asg"
web_instance_asg_max_instance_size                        = 2
web_instance_asg_min_instance_size                        = 1
web_security_group_id                                     = ["sg-0a7d75a49414ead24"]
web_instance_asg_group_cpu_scale_out_threshold_precentage = 80
web_instance_asg_group_cpu_scale_in_threshold_precentage  = 60
web_instance_launch_template_name                         = "OrderManager-ASG"
aws_autoscaling_group_name                                = "OrderManager"

# Load balancer configuration
alb_name              = "om-dev-us-east-1"
lb_public_subnet_ids  = ["subnet-0e9e971b3973a6ea7", "subnet-0010b6cc61b6e7c2c"]
lb_security_group_id  = ["sg-0a7d75a49414ead24"]
alb_listener_port     = "80"
alb_listener_protocol = "HTTP"
alb_vpc_id            = "vpc-04e46565bb5e772a5"
