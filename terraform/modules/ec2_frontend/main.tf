resource "aws_launch_template" "frontend" {
  name_prefix   = var.name_prefix
  image_id      = var.ami_id
  instance_type = var.instance_type
}

resource "aws_autoscaling_group" "asg" {
  launch_template {
    id      = aws_launch_template.frontend.id
  }

  vpc_zone_identifier = var.subnets
  min_size            = 2
  max_size            = 4
  desired_capacity    = 2
}
