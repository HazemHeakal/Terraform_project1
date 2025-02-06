module "load_balancer" {
  source     = "./modules/load_balancer"
  lb_name    = var.lb_name
  subnet_ids = var.subnet_ids
}

module "target_groups" {
  source        = "./modules/target_group"
  vpc_id        = var.vpc_id
  target_groups = var.target_groups
}

module "listener" {
  source             = "./modules/listener"
  lb_arn             = module.load_balancer.lb_arn
  cert_arn           = var.cert_arn
  target_group_arns  = module.target_groups.target_group_arns
  listener_rules     = var.listener_rules
}

module "ec2" {
  source         = "./modules/ec2"
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  subnet_id      = var.subnet_ids[0] # Using the first subnet for EC2
  sg_ids         = var.sg_ids
  instance_name  = var.instance_name
}
