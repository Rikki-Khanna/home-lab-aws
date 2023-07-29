output "ebs" {
  value       = aws_ebs_volume.ebs.id
  description = "Id for ebs volumne."
}
