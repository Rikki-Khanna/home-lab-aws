module "default" {
  source            = "../../"
  cidr_block        = "10.0.0.0/24"
  subnet_cidr_block = "10.1.0.0/16"
  availability_zone = "ap-south-1a"
  subnet_tags       = { Name = "homelab_subnet_test" }
}