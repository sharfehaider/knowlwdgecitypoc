variable "name_prefix" {
  description = "Prefix for resource names"
}

variable "private_subnets" {
  description = "Private subnets for RDS"
}

variable "availability_zones" {
  description = "Availability zones for RDS"
}

variable "engine" {
  description = "Database engine (e.g., aurora, mysql)"
  default     = "aurora-mysql"
}

variable "engine_version" {
  description = "Database engine version"
  default     = "5.7.mysql_aurora.2.10.0"
}

variable "db_name" {
  description = "Name of the database"
}

variable "master_username" {
  description = "Master username for the database"
}

variable "master_password" {
  description = "Master password for the database"
  sensitive   = true
}

variable "instance_count" {
  description = "Number of RDS instances"
  default     = 2
}

variable "instance_class" {
  description = "Instance class for RDS instances"
  default     = "db.t3.medium"
}

variable "kms_key_id" {
  description = "KMS key ID for encryption"
}
