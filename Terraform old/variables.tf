variable "region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "aws_ssh_key_pair" {
  type        = string
  description = "AWS SSH key pair"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default = {
    Environment = "dev"
    Platform    = "tillster"
    Tenant      = "shared"
    Service     = "om"
    Purpose     = "om"
  }
}

# Web instance parameters

variable "web_instance_ami" {
  type        = string
  description = "Web instance ami"
}

variable "web_instance_type" {
  type        = string
  description = "Web instance type"
  default     = "t3.medium"
}

variable "web_instance_asg_max_instance_size" {
  type        = number
  description = "ASG max instance size"
  default     = 2
}

variable "web_instance_asg_min_instance_size" {
  type        = number
  description = "ASG min instance size"
  default     = 1
}

variable "web_security_group_id" {
  type        = list(string)
  description = "Web Security Group id"
}

variable "web_instance_asg_group_cpu_scale_out_threshold_precentage" {
  type        = number
  description = "ASG scaling group CPU scale-out threshold percentage"
  default     = 80
}

variable "web_instance_asg_group_cpu_scale_in_threshold_precentage" {
  type        = number
  description = "ASG scaling group CPU scale-in threshold percentage"
  default     = 60
}

# Web instance ASG parameters

variable "web_instance_launch_template_name" {
  type        = string
  description = "Web instance launch template name"
}

variable "aws_autoscaling_group_name" {
  type        = string
  description = "AWS autoscaling group name"
}

variable "web_instance_scaling_adjustment" {
  type        = number
  description = "Number of instances by which to scale"
  default     = 1
}

variable "web_private_subnet_ids" {
  type        = list(string)
  description = "Web private subnet ids"
}

variable "alb_vpc_id" {
  type        = string
  description = "ALB VPC Id"
}

variable "asg_web_instance_name" {
  type        = string
  description = "ASG web instance name"
}

variable "alb_name" {
  type        = string
  description = "Name of application load balancer"
}

variable "lb_public_subnet_ids" {
  type        = list(string)
  description = "LB private subnet ids"
}

variable "lb_security_group_id" {
  type        = list(string)
  description = "LB security group ids"
}

variable "alb_listener_port" {
  type        = string
  description = "ALB listener port"
}

variable "alb_listener_protocol" {
  type        = string
  description = "ALB listener protocol"
}

variable "alb_idle_timeout" {
  type        = number
  description = "ALB idle timeout"
  default     = 600
}
