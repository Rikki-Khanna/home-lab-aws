module "ec2_instance_a" {
  source = "./modules/ec2_instance"

  ami = "ami-0c55b159cbfafe1f0"

  instance_type = "t2.micro"

  availability_zone = "ap-south-1a"

  key_name = "homelab_key_a"

  cidr_block = "10.0.0.0/24"

  subnet_cidr_block = "10.1.0.0/16"

  device_name = "homelab_a"

  ebs_size = 10

  tags = { Name = "homelab_ec2_instance_a" }

  ebs_tags = { Name = "homelab_ebs_a" }

  subnet_tags = { Name = "homelab_subnet_a" }
}

module "ec2_instance_b" {
  source = "./modules/ec2_instance"

  ami = "ami-0c55b159cbfafe1f0"

  instance_type = "t2.micro"

  availability_zone = "ap-south-1b"

  key_name = "homelab_key_b"

  cidr_block = "10.0.0.0/24"

  subnet_cidr_block = "10.2.0.0/16"

  device_name = "homelab_b"

  ebs_size = 10

  tags = { Name = "homelab_ec2_instance_b" }

  ebs_tags = { Name = "homelab_ebs_b" }

  subnet_tags = { Name = "homelab_subnet_b" }
}