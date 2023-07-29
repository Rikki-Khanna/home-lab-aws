variable "cidr_block" {
  type        = string
  description = "CIDR range of VPC"
}

variable "subnet_cidr_block" {
  type        = string
  description = "CIDR range of Subnet"
}

variable "availability_zone" {
  type        = string
  description = "A EC2 availability zones in which resource will be created."
  default     = "ap-south-1a"
}

variable "vpc_tags" {
  type        = map(string)
  default     = {}
  description = "Tags for vpc created by this module (key = tag name, value = tag value)"
}

variable "subnet_tags" {
  type        = map(string)
  default     = {}
  description = "Tags for subnet created by this module (key = tag name, value = tag value)"
}