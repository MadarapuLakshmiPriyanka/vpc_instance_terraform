resource "aws_subnet" "subnets" {
    count=4
    vpc_id = aws_vpc.dev.id
    cidr_block = element(var.cidr_block_subnet,count.index)
    availability_zone = element(var.avzs,count.index)
    map_public_ip_on_launch = true
    tags = {
        "Name" = "${var.vpc_name}-publicsubnet${count.index+1}"
    }
}