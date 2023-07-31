variable "vpc_id" {
  type        = string
  description = "VPC id in which subnet needs to be created."
}

variable "subnet_cidr_block" {
  type        = string
  description = "CIDR range of Subnet under VPC CIDR range."
}

variable "availability_zone" {
  type        = string
  description = "A EC2 availability zones in which resource will be created."
  default     = "ap-south-1a"
}

variable "subnet_tags" {
  type        = map(string)
  default     = {}
  description = "Tags for subnet created by this module (key = tag name, value = tag value)"
}