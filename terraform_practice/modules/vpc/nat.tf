resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_a_cidr
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = false

  tags = {
    Name = var.private-subnet-1
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_b_cidr
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = false

  tags = {
    Name = var.private-subnet-2
  }
}


resource "aws_eip" "nat-1-ip" {
  domain     = "vpc"
  depends_on = [aws_internet_gateway.gw]

}

resource "aws_eip" "nat-2-ip" {
  domain     = "vpc"
  depends_on = [aws_internet_gateway.gw]

}
resource "aws_nat_gateway" "nat1" {
  allocation_id = aws_eip.nat-1-ip.id
  subnet_id     = aws_subnet.private_subnet_1.id

  tags = {
    name = var.gw_nat_1
  }

}

resource "aws_nat_gateway" "nat2" {
  allocation_id = aws_eip.nat-2-ip.id
  subnet_id     = aws_subnet.private_subnet_1.id

  tags = {
    name = var.gw_nat_2
  }

}

### vpc setup for nat
resource "aws_route_table" "main_private_1" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = var.vpc_cidr_block
    nat_gateway_id = aws_nat_gateway.nat1.id
  }

}

resource "aws_route_table" "main_private_2" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = var.vpc_cidr_block
    nat_gateway_id = aws_nat_gateway.nat2.id
  }

}

resource "aws_route_table_association" "private-1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.route.id

}

resource "aws_route_table_association" "private-2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.main_private_2.id

}
