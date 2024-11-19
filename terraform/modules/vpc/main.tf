resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_subnet" "private" {
  count = length(var.azs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.cidr_block, 4, count.index)
  availability_zone = element(var.azs, count.index)
}

resource "aws_subnet" "public" {
  count = length(var.azs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.cidr_block, 4, count.index)
  availability_zone = element(var.azs, count.index)
}



resource "aws_security_group" "default" {
  vpc_id = aws_vpc.main.id
}
