# Create a VPC
resource "aws_vpc" "earth_vpc" {
  cidr_block = "12.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "earth-vpc"
  }
}

# Create a public subnet within the VPC
resource "aws_subnet" "earth_subnet1" {
  vpc_id                  = aws_vpc.earth_vpc.id
  cidr_block              = "12.0.0.0/20"
  availability_zone       = var.availability_zone_1a
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags = {
    Name = "earth-subnet1"
  }
}

# Create a public subnet within the VPC
resource "aws_subnet" "earth_subnet2" {
  vpc_id                  = aws_vpc.earth_vpc.id
  cidr_block              = "12.0.16.0/20"
  availability_zone       = var.availability_zone_1b
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags = {
    Name = "earth-subnet1"
  }
}

# Create an internet gateway and attach it to the VPC
resource "aws_internet_gateway" "earth_igw" {
  vpc_id = aws_vpc.earth_vpc.id
  tags = {
    Name = "earth-igw"
  }
}

# Create a route table and associate it with the vpc and IGW
resource "aws_route_table" "earth_routetable" {
  vpc_id = aws_vpc.earth_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.earth_igw.id
  }
  tags = {
    Name = "earth-routetable"
  }
}

resource "aws_route_table_association" "earth_subnet_association" {
  subnet_id      = aws_subnet.earth_subnet1.id
  route_table_id = aws_route_table.earth_routetable.id
}

resource "aws_route_table_association" "earth_subnet2_association" {
  subnet_id      = aws_subnet.earth_subnet2.id
  route_table_id = aws_route_table.earth_routetable.id
}



