module "volume" {
  source            = "../ebs"
  availability_zone = var.availability_zone
  ebs_size          = var.ebs_size
  ebs_tags          = var.ebs_tags
}

module "subnet" {
  source            = "../subnet"
  subnet_cidr_block = var.subnet_cidr_block
  availability_zone = var.availability_zone
  cidr_block        = var.cidr_block
  subnet_tags       = var.subnet_tags
  vpc_tags          = var.vpc_tags
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = var.device_name
  volume_id   = module.volume.ebs
  instance_id = aws_instance.main.id
}

resource "aws_instance" "main" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = module.subnet.subnet_id

  availability_zone = var.availability_zone

  vpc_security_group_ids = var.vpc_security_group_ids

  tags = var.tags
}