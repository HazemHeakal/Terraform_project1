vpc_id       = "vpc-04e46565bb5e772a5"
subnet_ids   = ["subnet-0010b6cc61b6e7c2c", "subnet-0e9e971b3973a6ea7"]
ami_id       = "ami-0123456789abcdef0" # Replace with your actual AMI ID
sg_ids       = ["sg-02e542e1c64606b93", "sg-0471b8775cede53f9"]
lb_name      = "occ-dev-us-east-1"
cert_arn     = "arn:aws:acm:us-east-1:659084848622:certificate/783669b9-17cf-45bb-82a9-15213bda1954"
instance_name = "occ-dev-instance"

target_groups = [
  {
    name        = "occ-dev-us-east-1-dev"
    port        = 81
    health_path = "/Home/HealthCheck"
  },
  {
    name        = "occ-dev-us-east-1-qa"
    port        = 80
    health_path = "/Home/HealthCheck"
  },
  {
    name        = "occ-dev-us-east-1-loadtest"
    port        = 82
    health_path = "/Home/HealthCheck"
  },
  {
    name        = "occ-dev-us-east-1-lb-alb-tg"
    port        = 82
    health_path = "/Home/HealthCheck"
  }
]

listener_rules = [
  {
    priority    = 5
    host_header = "*.dev.tillster.com"
    tg_name     = "occ-dev-us-east-1-dev"
  },
  {
    priority    = 10
    host_header = "*.qa.tillster.com"
    tg_name     = "occ-dev-us-east-1-qa"
  },
  {
    priority    = 15
    host_header = "*.loadtest.tillster.com"
    tg_name     = "occ-dev-us-east-1-loadtest"
  }
]
