variable "main_sg_name" {
  default = "default_web_sg"
}

variable "main_sg_description" {
  default = "allow ssh connection"
}

variable "open_internet" {
  default = "0.0.0.0/0"
}

variable "egress_ports" {
  description = "allow all egress connections"
  default     = 0
}

variable "vpc_id" {
  description = "vpc id for sg"
}

variable "ingress_ports" {
  type        = list(number)
  description = "ingress ports"
  default     = [22, 80, 3306, 8080]
}