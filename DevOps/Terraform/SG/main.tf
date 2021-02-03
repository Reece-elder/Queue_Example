resource "aws_security_group" "main_SG" {
  name        = var.main_SG_name
  description = var.main_SG_description
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_ports
    content {
      from_port   = port.value
      protocol    = "tcp"
      to_port     = port.value
      cidr_blocks = [var.open_internet]
    }
  }

  egress {
    from_port   = var.egress_ports
    protocol    = "-1"
    to_port     = var.egress_ports
    cidr_blocks = [var.open_internet]
  }
}