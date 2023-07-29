module "aws_instance" {
  source = "../../"

  ami = "ami-0c55b159cbfafe1f0"

  instance_type = "t2.micro"

  key_name = "homelab_key"

  subnet_cidr_block = "10.2.0.0/16"

  availability_zone = "ap-south-1a"

  cidr_block = "10.0.0.0/24"

  ebs_size = 10

  device_name = "homelab"

  tags = { Name = "homelab_ec2_instance" }

  ebs_tags = { Name = "homelab_ebs" }

  subnet_tags = { Name = "homelab_subnet" }
}