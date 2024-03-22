resource "aws_route_table" "dev-rt" {
  vpc_id = aws_vpc.dev.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev-igw.id
  }
  tags = {
    "Name" = "${var.vpc_name}-rt"
  }
}

resource "aws_route_table_association" "rt-association" {
  count = 4
  subnet_id = element(aws_subnet.subnets[*].id,count.index)
  route_table_id = aws_route_table.dev-rt.id
}