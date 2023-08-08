module "s3_bucket" {
  source = "./modules/s3_bucket"

  bucket_name = "mytest-home-lab-testbucket"

  use_prefix = false

  acl = "private"

}