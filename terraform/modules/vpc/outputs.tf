output "valaxy_vpc_id" {
    value = aws_vpc.valaxy_vpc.id
    description = "Id of VPC"
}

output "valaxy_subnet1_id" {
    value = aws_subnet.valaxy_subnet1.id
    description = "Id of Subnet"
}

output "igw_id" {
    value = aws_internet_gateway.valaxy_igw.id
}

