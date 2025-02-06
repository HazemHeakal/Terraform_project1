variable "ami_id" {
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  description = "EC2 Instance type"
  default     = "t3.medium"
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
}

variable "sg_ids" {
  description = "Security groups for the EC2 instance"
  type        = list(string)
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
}
