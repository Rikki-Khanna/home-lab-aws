module "vpc_test" {
  source     = "../../"
  cidr_block = "10.0.0.0/16"
  vpc_tags   = { Name = "homelab_vpc_test" }
}