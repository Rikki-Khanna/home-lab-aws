variable "cidr_block" {
  type        = string
  description = "CIDR range of VPC"
}

variable "vpc_tags" {
  type        = map(string)
  default     = {}
  description = "Tags for vpc created by this module (key = tag name, value = tag value)"
}