resource "aws_lb" "new_lb" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  subnets            = var.subnet_ids

  tags = {
    Name = var.lb_name
  }
}
