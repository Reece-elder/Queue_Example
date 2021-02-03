variable "ami_id" {
  default = "ami-0dc8d444ee2a42d8a"
}

variable "instance" {
  default = "t2.micro"
}

variable "key1" {
  description = "Default Keypair"
}

variable "subnet_id" {
  description = "subnet_ID"
}

variable "vpc_security_group_ids" {
  description = "array of Secutiy Group Ids"
}

variable "enable_public_ip" {
  default = "true"
}

variable "name" {
  description = "name of EC2"
}

variable "ec2" {
  description = "EC2 image"
  default     = "t2.micro"
}