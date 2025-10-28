variable "project_name" {
    default = "azharproject"
}

variable "environment" {
  default  =   "dev"
}

variable "sg_names" {
  default = [
    #database
    "mongodb", "redis", "rabbitmq", "mysql",
    #backend
    "catalogue", "user", "cart", "shipping", "payment",
    #frontend
    "frontend",
    #bastion
    "bastion",
    # frontend load balancer
    "frontend_alb",
    # Backend ALB
    "backend_alb"
  ]
}