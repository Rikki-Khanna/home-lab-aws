variable "device_name" {
  type        = string
  description = "EBS block device name."
}

variable "volume_id" {
  type        = string
  description = "EBS volume id which needs to be attached with instance."
  default     = "ap-south-1a"
}

variable "instance_id" {
  type        = string
  description = "EC2 Instance Id."
}