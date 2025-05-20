resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
  
}

resource "aws_subnet" "main_subnets" {
  vpc_id = aws_vpc.main_vpc.id
  count = 2
  cidr_block = var.public_subnets_cidrs[count.index]
  availability_zone = var.azs[count.index]
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "vpc_main_igw" {
  vpc_id = aws_vpc.main_vpc.id
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id

}

resource "aws_route" "external_route" {
  route_table_id = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.vpc_main_igw.id
}

resource "aws_route_table_association" "public_rt_assoc" {
  count = length(var.public_subnets_cidrs)
  subnet_id = aws_subnet.main_subnets[count.index].id
  route_table_id = aws_route_table.public_rt.id
}
