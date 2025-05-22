#DocumentDB cluster and instance
resource "aws_docdb_cluster" "docdb_cluster" {
  cluster_identifier = "docdb-demo-cluster"
  engine = "docdb"
  master_username = "root"
  master_password = "root_password"
  availability_zones = var.azs
  vpc_security_group_ids = [aws_security_group.docdb_sg.id]
  db_subnet_group_name = aws_docdb_subnet_group.docdb_subnet_group.name
  skip_final_snapshot = true
}

resource "aws_docdb_cluster_instance" "docdb_demo_ins" {
  count = 1
  identifier = "docdb-instance-${count.index}"
  cluster_identifier = aws_docdb_cluster.docdb_cluster.id
  instance_class = "db.t3.medium"

}

#Subnet block for DocumnetDB
resource "aws_subnet" "docdb_subnet_private" {
  vpc_id = aws_vpc.main_vpc.id
  count = 2
  cidr_block = var.private_subnets_cidrs[count.index]
  availability_zone = var.azs[count.index]
  map_public_ip_on_launch = false
}

resource "aws_docdb_subnet_group" "docdb_subnet_group" {
  subnet_ids = aws_subnet.docdb_subnet_private[*].id
  name = "docdb-subnet-group"
}

#Security group and rules for DocumentDB
resource "aws_security_group" "docdb_sg" {
  name = "docdb-sg"
  vpc_id = aws_vpc.main_vpc.id
}

resource "aws_vpc_security_group_ingress_rule" "docdb_allow_from_ec2_1" {
  security_group_id = aws_security_group.docdb_sg.id
  cidr_ipv4 = var.public_subnets_cidrs[0]
  ip_protocol = "tcp"
  from_port = 27017
  to_port = 27017
}

resource "aws_vpc_security_group_ingress_rule" "docdb_allow_from_ec2_2" {
  security_group_id = aws_security_group.docdb_sg.id
  cidr_ipv4 = var.public_subnets_cidrs[1]
  ip_protocol = "tcp"
  from_port = 27017
  to_port = 27017
}

resource "aws_vpc_security_group_egress_rule" "docdb_allow_all_from_docdb" {
  security_group_id = aws_security_group.docdb_sg.id
  ip_protocol = "-1"
  cidr_ipv4 = "0.0.0.0/0"
}

