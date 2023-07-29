module "default" {
  source            = "../../"
  availability_zone = "ap-south-1b"
  ebs_size          = 10
  ebs_tags          = { Name = "homelab" }
}