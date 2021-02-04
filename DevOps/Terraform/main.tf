provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "/home/ubuntu/.aws.credentials"
}

module "vpc" {
  source = "./VPC"
}

module "sg_node" {
  main_sg_name  = "sg for vpc"
  source        = "./SG"
  open_internet = "0.0.0.0/0"
  vpc_id        = module.vpc.vpc_id
  ingress_ports = [22, 80, 3306, 8080]
}

resource "aws_key_pair" "key_pub" {
  key_name   = "key_pub"
  public_key = file(var.key_pub)
}

module "JenkinsVM" {
  source                 = "./EC2"
  name                   = "jenkins_VM"
  subnet_id              = module.vpc.subnet_a_id
  vpc_security_group_ids = [module.sg_node.sg_id]
  key1                   = aws_key_pair.key_pub.id
}

module "TestVM" {
  source                 = "./EC2"
  name                   = "test_VM"
  subnet_id              = module.vpc.subnet_a_id
  vpc_security_group_ids = [module.sg_node.sg_id]
  key1                   = aws_key_pair.key_pub.id
  instance               = "t2.medium"
}




