resource "aws_security_group" "dev-sg" {
  vpc_id = aws_vpc.dev.id
  description = "sg creation"
  ingress {
    to_port = 0
    from_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress{
    to_port = 0
    from_port = 0
    protocol = -1
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  tags = {
    "Name" = "${var.vpc_name}-sg"
  }
}