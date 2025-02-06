variable "alb_name" {
  type        = string
  description = "Name of the Application Load Balancer"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "List of security group IDs for the ALB"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where the ALB will be deployed"
}

variable "target_id" {
  type        = string
  description = "Target group ID for the ALB to route traffic to"
}

variable "subnet_id" {
  type        = list(string)
  description = "List of subnet IDs where the ALB will be deployed"
}

variable "listener_port" {
  type        = string
  description = "Port on which the ALB will listen"
}

variable "listener_protocol" {
  type        = string
  description = "Protocol for the ALB listener (e.g., HTTP, HTTPS)"
}

variable "alb_idle_timeout" {
  type        = number
  description = "Idle timeout for the ALB in seconds"
  default     = 600
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}
