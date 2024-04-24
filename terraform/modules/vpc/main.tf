# Create a VPC
resource "aws_vpc" "valaxy_vpc" {
  cidr_block = "12.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "valaxy-vpc"
  }
}

# Create a public subnet within the VPC
resource "aws_subnet" "valaxy_subnet1" {
  vpc_id                  = aws_vpc.valaxy_vpc.id
  cidr_block              = "12.0.0.0/20"
  availability_zone       = var.availability_zone 
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags = {
    Name = "valaxy-subnet1"
  }
}

# Create an internet gateway and attach it to the VPC
resource "aws_internet_gateway" "valaxy_igw" {
  vpc_id = aws_vpc.valaxy_vpc.id
  tags = {
    Name = "valaxy-igw"
  }
}

# Create a route table and associate it with the vpc and IGW
resource "aws_route_table" "valaxy_routetable" {
  vpc_id = aws_vpc.valaxy_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.valaxy_igw.id
  }

  tags = {
    Name = "valaxy-routetable"
  }
}

resource "aws_route_table_association" "pfo_subnet_association" {
  subnet_id      = aws_subnet.valaxy_subnet1.id
  route_table_id = aws_route_table.valaxy_routetable.id
}

/*resource "aws_route_table_association" "pfo_subnet_association2" {
  subnet_id      = aws_subnet.valaxy_subnet2.id
  route_table_id = aws_route_table.valaxy_routetable.id
}*/



