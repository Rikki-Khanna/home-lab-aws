locals {
  tag_prefix        = "homelab_"
  availability_zone = "ap-south-1a"
  ami_id            = "ami-0c55b159cbfafe1f0"
  instance_type     = "t2.micro"
  key_name          = "homelab_key"
}

module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  vpc_tags   = { Name = "${local.tag_prefix}vpc" }
}

module "subnet_a" {
  source            = "./modules/subnet"
  vpc_id            = module.vpc.vpc_id
  subnet_cidr_block = "10.1.0.0/24"
  availability_zone = local.availability_zone
  subnet_tags       = { Name = "${local.tag_prefix}subnet_a" }
}

module "subnet_b" {
  source            = "./modules/subnet"
  vpc_id            = module.vpc.vpc_id
  subnet_cidr_block = "10.2.0.0/24"
  availability_zone = local.availability_zone
  subnet_tags       = { Name = "${local.tag_prefix}subnet_b" }
}

module "ebs_a" {
  source            = "./modules/ebs"
  availability_zone = local.availability_zone
  ebs_size          = 10
  ebs_tags          = { Name = "${local.tag_prefix}_ebs_a" }
}

module "ebs_b" {
  source            = "./modules/ebs"
  availability_zone = local.availability_zone
  ebs_size          = 10
  ebs_tags          = { Name = "${local.tag_prefix}_ebs_b" }
}

module "ec2_instance_a" {
  source = "./modules/ec2_instance"

  ami = local.ami_id

  instance_type = local.instance_type

  key_name = local.key_name

  subnet_id = module.subnet_a.subnet_id

  ec2_tags = { Name = "${local.tag_prefix}ec2_instance_a" }

}

module "ec2_instance_b" {
  source = "./modules/ec2_instance"

  ami = local.ami_id

  instance_type = local.instance_type

  key_name = local.key_name

  subnet_id = module.subnet_b.subnet_id

  ec2_tags = { Name = "${local.tag_prefix}ec2_instance_b" }

}


module "ebs_volume_a" {
  source = "./modules/ebs_volume"

  device_name = "${local.tag_prefix}a"

  instance_id = module.ec2_instance_a.instance_id

  volume_id = module.ebs_a.volume_id

}

module "ebs_volume_b" {
  source = "./modules/ebs_volume/"

  device_name = "${local.tag_prefix}b"

  instance_id = module.ec2_instance_b.instance_id

  volume_id = module.ebs_b.volume_id

}