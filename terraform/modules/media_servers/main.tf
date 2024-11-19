resource "aws_instance" "media_servers" {
  count         = length(var.subnets)
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = element(var.subnets, count.index)
  security_groups = var.security_group_ids

  tags = {
    Name = "${var.name_prefix}-${count.index}"
  }
}
