resource "aws_instance" "ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance
  key_name                    = var.key1
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.vpc_security_group_ids
  associate_public_ip_address = var.enable_public_ip
  tags = {
    name = var.name
  }
}