variable "kms_description" {
  description = "Description of the KMS key"
  default     = "Key for encrypting sensitive data"
}

variable "kms_key_alias" {
  description = "Alias name for the KMS key"
  default     = "my-kms-key"
}

