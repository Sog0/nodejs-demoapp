#LAUNCH TEMPLATE
resource "aws_launch_template" "demoapp_lt" {
  name_prefix = "demoapp-lt"
  image_id = "ami-0953476d60561c955"
  vpc_security_group_ids = [aws_security_group.demo_sg.id]
  instance_type = "${var.instance_type}"
  user_data = base64encode(file("../../user_data/user_data.sh"))
}


#SECURITY GROUP BLOCK
resource "aws_security_group" "demo_sg" {
  vpc_id = aws_vpc.main_vpc.id
  name = "demoapp_sg"
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" { 
  security_group_id = aws_security_group.demo_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" { 
  security_group_id = aws_security_group.demo_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.demo_sg.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.demo_sg.id
  cidr_ipv6 = "::/0"
  ip_protocol = "-1"
}

#AUTOSCALING GROUP
resource "aws_autoscaling_group" "demo-al" {
  vpc_zone_identifier = [ for subnet in aws_subnet.main_subnets : subnet.id ]
  desired_capacity = 2
  min_size = 2
  max_size = 3
  target_group_arns = [aws_lb_target_group.demo_lb_tg.arn]
  launch_template {
    id = aws_launch_template.demoapp_lt.id
    version = aws_launch_template.demoapp_lt.latest_version
  }
}