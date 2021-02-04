variable "dbname" {
  description = "database name"
  type        = string
}

variable "dbsubnet_gpname" {
  description = "database subnet group name"
  default     = "default"
}

variable "subnet_ids" {
  description = "list of subnet ids"
}

variable "vpc_security_group_ids" {
  description = "list of sg ids"
}

variable "rds_password" {
  description = "password for db master user"
  type        = string
  sensitive   = true
}

variable "rds_username" {
  description = "username for db master user"
  type        = string
  sensitive   = true
}