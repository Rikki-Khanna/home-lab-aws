locals {
  tag_prefix        = "homelab_"
  availability_zone = "ap-south-1a"
  ami_id            = "ami-008b85aa3ff5c1b02"
  instance_type     = "t2.micro"
  device_name       = "/dev/sdh"
}

module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  vpc_tags   = { Name = "${local.tag_prefix}vpc" }
}

module "subnet_a" {
  source            = "./modules/subnet"
  vpc_id            = module.vpc.vpc_id
  subnet_cidr_block = "10.0.1.0/24"
  availability_zone = local.availability_zone
  subnet_tags       = { Name = "${local.tag_prefix}subnet_a" }
}

module "subnet_b" {
  source            = "./modules/subnet"
  vpc_id            = module.vpc.vpc_id
  subnet_cidr_block = "10.0.2.0/24"
  availability_zone = local.availability_zone
  subnet_tags       = { Name = "${local.tag_prefix}subnet_b" }
}

module "ebs_a" {
  source            = "./modules/ebs"
  availability_zone = local.availability_zone
  ebs_size          = 10
  ebs_tags          = { Name = "${local.tag_prefix}ebs_a" }
}

module "ebs_b" {
  source            = "./modules/ebs"
  availability_zone = local.availability_zone
  ebs_size          = 10
  ebs_tags          = { Name = "${local.tag_prefix}ebs_b" }
}

module "ec2_instance_a" {
  source = "./modules/ec2_instance"

  ami = local.ami_id

  instance_type = local.instance_type

  subnet_id = module.subnet_a.subnet_id

  ec2_tags = { Name = "${local.tag_prefix}ec2_instance_a" }

}

module "ec2_instance_b" {
  source = "./modules/ec2_instance"

  ami = local.ami_id

  instance_type = local.instance_type

  subnet_id = module.subnet_b.subnet_id

  ec2_tags = { Name = "${local.tag_prefix}ec2_instance_b" }

}


module "ebs_volume_a" {
  source = "./modules/ebs_volume"

  device_name = local.device_name

  instance_id = module.ec2_instance_a.instance_id

  volume_id = module.ebs_a.volume_id

}

module "ebs_volume_b" {
  source = "./modules/ebs_volume/"

  device_name = local.device_name

  instance_id = module.ec2_instance_b.instance_id

  volume_id = module.ebs_b.volume_id

}