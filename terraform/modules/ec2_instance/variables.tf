variable "ami" {
  type        = string
  description = "AMI ID for creating ec2 instance."
}

variable "instance_type" {
  type        = string
  description = "Type of ec2 instance."
}

variable "key_name" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the `aws_key_pair` resource"
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate."
  type        = list(string)
  default     = null
}

variable "subnet_id" {
  description = "A subnet id."
  type        = string
}

variable "ec2_tags" {
  type        = map(string)
  default     = {}
  description = "Tags for ec2 instance created by this module (key = tag name, value = tag value)"
}