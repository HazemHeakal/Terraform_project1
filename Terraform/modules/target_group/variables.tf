variable "vpc_id" {}
variable "target_groups" {
  type = list(object({
    name        = string
    port        = number
    health_path = string
  }))
}
