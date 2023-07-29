module "aws_vpc" {
  source     = "../vpc"
  cidr_block = var.cidr_block
  vpc_tags   = var.vpc_tags
}

resource "aws_subnet" "subnet" {

  vpc_id = module.aws_vpc.vpc

  cidr_block = var.subnet_cidr_block

  availability_zone = var.availability_zone

  tags = var.subnet_tags
}