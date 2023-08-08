module "ebs_test" {
  source            = "../../../ebs"
  availability_zone = "ap-south-1b"
  ebs_size          = 10
  ebs_tags          = { Name = "homelab" }
}

module "vpc_test" {
  source     = "../../../vpc"
  cidr_block = "10.0.0.0/24"
  vpc_tags   = { Name = "homelab_vpc_test" }
}

module "subnet_test" {
  source            = "../../../subnet"
  vpc_id            = module.vpc_test.vpc_id
  subnet_cidr_block = "10.1.0.0/16"
  availability_zone = "ap-south-1a"
  subnet_tags       = { Name = "homelab_subnet_test" }
}


module "ec2_instance_test" {
  source = "../../../ec2_instance"

  ami = "ami-0c55b159cbfafe1f0"

  instance_type = "t2.micro"

  key_name = "homelab_key"

  subnet_id = module.subnet_test.subnet_id

  ec2_tags = { Name = "homelab_ec2_instance" }

}

module "ebs_volume_test" {
  source = "../../"

  device_name = "/dev/sdh"

  instance_id = module.ec2_instance_test.instance_id

  volume_id = module.ebs_test.volume_id

}