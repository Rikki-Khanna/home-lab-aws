module "default" {
  source = "../../"

  bucket_name = "home-lab-test"

  use_prefix = false

  acl = "private"

}