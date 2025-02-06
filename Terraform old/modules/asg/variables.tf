variable "region" {
  type        = string
  description = "AWS region"
  default     = "eu-west-1"
}

variable "aws_launch_template_name" {
  type        = string
  description = "Name of the AWS launch template"
}

variable "aws_launch_template_image_id" {
  type        = string
  description = "AMI ID for the EC2 instances"
}

variable "aws_launch_template_instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "aws_launch_template_key_name" {
  type        = string
  description = "SSH key pair name for EC2 access"
}

variable "aws_launch_template_associate_public_ip" {
  type        = bool
  description = "Whether to associate a public IP with the instance"
  default     = false
}

variable "asg_max_instance_size" {
  type        = number
  description = "Maximum number of instances for ASG"
}

variable "asg_min_instance_size" {
  type        = number
  description = "Minimum number of instances for ASG"
}

variable "asg_group_cpu_scale_out_threshold_percentage" {
  type        = string
  description = "ASG CPU scale-out threshold percentage"
}

variable "asg_group_cpu_scale_in_threshold_percentage" {
  type        = string
  description = "ASG CPU scale-in threshold percentage"
}

variable "asg_instance_scaling_adjustment" {
  type        = number
  description = "Number of instances to scale in or out"
}

variable "aws_autoscaling_group_name" {
  type        = string
  description = "Name of the Auto Scaling group"
}

variable "aws_autoscaling_group_enabled_metrics" {
  type        = list(string)
  description = "List of AWS autoscaling group enabled metrics"
  default = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
  ]
}

variable "aws_autoscaling_group_metrics_granularity" {
  type        = string
  description = "Granularity of the AWS autoscaling group metrics"
  default     = "1Minute"
}

variable "asg_group_vpc_zone_identifier" {
  type        = list(string)
  description = "List of VPC subnet IDs for ASG"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "aws_launch_template_security_group" {
  type        = list(string)
  description = "List of security groups for the launch template"
}

variable "asg_web_instance_name" {
  type        = string
  description = "Name tag for the ASG instances"
}