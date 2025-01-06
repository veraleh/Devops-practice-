provider "aws" {
  region = var.region 
}

# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = var.vpc_name
  }
}

# Create Public Subnets (in separate availability zones)
resource "aws_subnet" "public_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_a_cidr
  availability_zone       = "${var.region}a"
  
  tags = {
    Name = var.public_subnet_a_name
  }
}

resource "aws_subnet" "public_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_b_cidr
  availability_zone       = "${var.region}b"
 
  tags = {
    Name = var.public_subnet_b_name
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name =var.aws_internet_gateway_name
  }
}

# Create a Route Table
resource "aws_route_table" "route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.rtb_cidr
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = var.aws_route_table_name
  }
}

# Associate the route table with the subnets
resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.route.id
}

resource "aws_route_table_association" "public_b" {
 subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.route.id
}