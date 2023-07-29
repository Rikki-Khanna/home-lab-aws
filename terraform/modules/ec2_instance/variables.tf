variable "ami" {
  type        = string
  description = "AMI ID for creating ec2 instance."
}

variable "device_name" {
  type        = string
  description = "EBS block device name."
}

variable "instance_type" {
  type        = string
  description = "Type of ec2 instance."
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = null
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags for ec2 instance created by this module (key = tag name, value = tag value)"
}

variable "ebs_tags" {
  type        = map(string)
  default     = {}
  description = "Tags for ebs volume resources created by this module (key = tag name, value = tag value)"
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

variable "key_name" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the `aws_key_pair` resource"
  type        = string
  default     = null
}

variable "ebs_size" {
  type        = number
  description = "size for ebs volumne"
}

variable "availability_zone" {
  type        = string
  description = "A EC2 availability zones in which resource will be created."
  default     = "ap-south-1a"
}

variable "cidr_block" {
  type        = string
  description = "CIDR range of VPC created by this module"
}

variable "subnet_cidr_block" {
  type        = string
  description = "CIDR range of subnet under VPC created by this module"
}