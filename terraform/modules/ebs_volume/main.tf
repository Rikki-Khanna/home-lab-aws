resource "aws_volume_attachment" "main" {

  device_name = var.device_name

  volume_id = var.volume_id

  instance_id = var.instance_id
}