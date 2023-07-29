resource "aws_ebs_volume" "ebs" {

  availability_zone = var.availability_zone

  size = var.ebs_size

  tags = var.ebs_tags
}