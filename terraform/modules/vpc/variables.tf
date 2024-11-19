variable "cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "Availability zones"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "name" {
  description = "Name prefix for resources"
  default     = "project"
}




