#LAUNCH TEMPLATE
resource "aws_launch_template" "demoapp_lt" {
  name_prefix = "demoapp-lt"
  image_id = "ami-0953476d60561c955"
  vpc_security_group_ids = [var.security_group_id]
  instance_type = "${var.instance_type}"
  user_data = base64encode(file("${var.user_data}"))
}


#AUTOSCALING GROUP
resource "aws_autoscaling_group" "demo-al" {
  vpc_zone_identifier = var.public_subnet_ids
  desired_capacity = 2
  min_size = 2
  max_size = 3
  target_group_arns = [var.target_group_arn]
  launch_template {
    id = aws_launch_template.demoapp_lt.id
    version = aws_launch_template.demoapp_lt.latest_version
  }
}

