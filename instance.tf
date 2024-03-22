resource "aws_instance" "dev-server" {
  ami = "ami-0cd59ecaf368e5ccf"
  instance_type = "t2.micro"
  key_name = "newkp"
  vpc_security_group_ids = [ aws_security_group.dev-sg.id ]
  associate_public_ip_address = true
  subnet_id = aws_subnet.subnets[0].id
  tags = {
    "Name" = "${var.vpc_name}-public-server"
  }
}