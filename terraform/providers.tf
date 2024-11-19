provider "aws" {
  alias  = "primary"
  region = var.primary_region
}

provider "aws" {
  alias  = "failover"
  region = var.failover_region
}

provider "aws" {
  region = var.primary_region
}

variable "primary_region" {
  description = "Primary AWS region"
  default     = "us-east-1"
}

variable "failover_region" {
  description = "Failover AWS region"
  default     = "us-west-2"
}
