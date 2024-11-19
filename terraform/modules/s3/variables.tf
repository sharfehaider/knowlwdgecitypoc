variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "acl" {
  description = "ACL for the S3 bucket"
  type        = string
  default     = "private"
}

variable "encryption_algorithm" {
  description = "Encryption algorithm for server-side encryption"
  type        = string
  default     = "AES256"
}

variable "kms_key_id" {
  description = "KMS Key ID for server-side encryption (optional)"
  type        = string
  default     = null
}

variable "versioning" {
  description = "Enable versioning for the S3 bucket"
  type        = bool
  default     = true
}

variable "policy_json" {
  description = "Optional JSON policy for the S3 bucket"
  type        = string
  default     = null
}

variable "environment" {
  description = "Environment tag for the bucket (e.g., dev, prod)"
  type        = string
  default     = "dev"
}

variable "additional_tags" {
  description = "Additional tags to apply to the bucket"
  type        = map(string)
  default     = {}
}
