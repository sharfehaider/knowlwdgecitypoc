variable "name_prefix" {
  description = "Prefix for naming the media servers"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the media servers"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the media servers"
  type        = string
}

variable "subnets" {
  description = "List of subnets for the media servers"
  type        = list(string)
}

variable "security_group_ids" {
  description = "Security groups for the media servers"
  type        = list(string)
}
