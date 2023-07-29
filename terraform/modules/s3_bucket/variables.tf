variable "bucket_name" {
  type        = string
  description = "Name of S3 Bucket"
}

variable "use_prefix" {
  type        = bool
  default     = true
  description = "Use consistent random number based on account id to prefix s3 bucket name"
}

variable "acl" {
  type        = string
  default     = "private"
  description = <<EOT
  (Optional) The canned ACL to apply to the bucket.

  Options:
  - private
  - public-read
  - public-read-write
  - aws-exec-read
  - authenticated-read
  - bucket-owner-read
  - bucket-owner-full-control
  - log-delivery-write

  Default: private
  EOT
  validation {
    condition     = can(regex("^private$|^public-read$|^public-read-write$|^aws-exec-read$|^authenticated-read$|^bucket-owner-read$|^bucket-owner-full-control$|^log-delivery-write$", var.acl))
    error_message = "Err: acl is not valid."
  }
}

variable "bucket_status" {
  type        = string
  default     = "Enabled"
  description = <<EOT
  (Optional) The canned ACL to apply to the bucket.

  Options:
  - Enabled
  - Suspended
  - Disabled
  
  Default: Enabled
  EOT
  validation {
    condition     = can(regex("^Enabled$|^Suspended$|^Disabled$", var.bucket_status))
    error_message = "Err: bucket_status is not valid."
  }
}

variable "object_lock_enabled" {
  type        = bool
  default     = false
  description = "Enabled object lock for a new bucket."
}

variable "tags" {
  description = "A map of tags to assign to the s3 object."
  type        = map(string)
  default     = {}
}

variable "force_destroy" {
  description = "Allow the object to be deleted by removing any legal hold on any object version. Default is false. This value should be set to true only if the bucket has S3 object lock enabled."
  type        = bool
  default     = false
}