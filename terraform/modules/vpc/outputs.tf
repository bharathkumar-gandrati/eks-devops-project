output "earth_vpc_id" {
    value = aws_vpc.earth_vpc.id
    description = "Id of VPC"
}

output "earth_subnet1_id" {
    value = aws_subnet.earth_subnet1.id
    description = "Id of Subnet"
}

output "earth_subnet2_id" {
    value = aws_subnet.earth_subnet2.id
    description = "Id of Subnet"
}


output "igw_id" {
    value = aws_internet_gateway.earth_igw.id
}

