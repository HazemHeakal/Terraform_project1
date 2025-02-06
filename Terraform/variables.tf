variable "vpc_id" {
  description = "The ID of the VPC"
}

variable "subnet_ids" {
  description = "List of Subnet IDs"
  type        = list(string)
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  description = "EC2 Instance type"
  default     = "t3.medium"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
}

variable "lb_name" {
  description = "Name of the load balancer"
}

variable "cert_arn" {
  description = "ARN of the SSL certificate for HTTPS listener"
}

variable "sg_ids" {
  description = "Security groups for EC2 instance"
  type        = list(string)
}

variable "target_groups" {
  description = "Target group configurations"
  type = list(object({
    name        = string
    port        = number
    health_path = string
  }))
}

variable "listener_rules" {
  description = "Rules for HTTPS listener"
  type = list(object({
    priority    = number
    host_header = string
    tg_name     = string
  }))
}
