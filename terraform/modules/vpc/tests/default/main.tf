module "default" {
  source     = "../../"
  cidr_block = "10.0.0.0/24"
  tags       = { Name = "homelab_vpc_test" }
}