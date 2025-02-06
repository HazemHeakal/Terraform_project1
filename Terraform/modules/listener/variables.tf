variable "lb_arn" {}
variable "cert_arn" {}
variable "target_group_arns" {
  type = map(string)
}
variable "listener_rules" {
  type = list(object({
    priority    = number
    host_header = string
    tg_name     = string
  }))
}
