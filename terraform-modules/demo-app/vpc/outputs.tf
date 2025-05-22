output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "public_subnet_ids" {
  value = aws_subnet.main_subnets[*].id
}

output "security_group_id" {
  value = aws_security_group.demo_sg.id
}