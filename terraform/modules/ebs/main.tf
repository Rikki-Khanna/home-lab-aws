resource "aws_ebs_volume" "main" {

  availability_zone = var.availability_zone

  size = var.ebs_size

  tags = var.ebs_tags
}