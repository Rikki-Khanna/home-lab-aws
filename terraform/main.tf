module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.0.0.0/24"
  vpc_tags   = { Name = "homelab_vpc" }
}

module "subnet_a" {
  source            = "./modules/subnet"
  vpc_id            = module.vpc.vpc_id
  subnet_cidr_block        = "10.1.0.0/16"
  availability_zone = "ap-south-1a"
  subnet_tags       = { Name = "homelab_subnet_a" }
}

module "subnet_b" {
  source            = "./modules/subnet"
  vpc_id            = module.vpc.vpc_id
  subnet_cidr_block        = "10.1.0.0/16"
  availability_zone = "ap-south-1a"
  subnet_tags       = { Name = "homelab_subnet_b" }
}

module "ebs_a" {
  source            = "./modules/ebs"
  availability_zone = "ap-south-1b"
  ebs_size          = 10
  ebs_tags          = { Name = "homelab_ebs_a" }
}

module "ebs_b" {
  source            = "./modules/ebs"
  availability_zone = "ap-south-1b"
  ebs_size          = 10
  ebs_tags          = { Name = "homelab_ebs_b" }
}

module "ec2_instance_a" {
  source = "./modules/ec2_instance"

  ami = "ami-0c55b159cbfafe1f0"

  instance_type = "t2.micro"

  key_name = "homelab_key"

  subnet_id = module.subnet_a.subnet_id

  ec2_tags = { Name = "homelab_ec2_instance_a" }

}

module "ec2_instance_b" {
  source = "./modules/ec2_instance"

  ami = "ami-0c55b159cbfafe1f0"

  instance_type = "t2.micro"

  key_name = "homelab_key"

  subnet_id = module.subnet_b.subnet_id

  ec2_tags = { Name = "homelab_ec2_instance_b" }

}


module "ebs_volume_a" {
  source = "./modules/ebs_volume"

  device_name = "homelab_a"

  instance_id = module.ec2_instance_a.instance_id

  volume_id = module.ebs_a.volume_id

}

module "ebs_volume_b" {
  source = "./modules/ebs_volume/"

  device_name = "homelab_b"

  instance_id = module.ec2_instance_b.instance_id

  volume_id = module.ebs_b.volume_id

}