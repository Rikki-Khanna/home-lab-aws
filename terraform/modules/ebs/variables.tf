variable "ebs_size" {
  type        = number
  description = "size for ebs volumne"
}

variable "availability_zone" {
  type        = string
  description = "A EC2 availability zones in which resource will be created."
  default     = "ap-south-1a"
}

variable "ebs_tags" {
  type        = map(string)
  default     = {}
  description = "Tags for ebs volume resources created by this module (key = tag name, value = tag value)"
}