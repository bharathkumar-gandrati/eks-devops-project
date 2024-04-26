variable "instance_ami_earth" {
    default = "ami-007020fd9c84e18c7"
    type = string
    description = "AMI for the Valaxy Servers"
}

variable "instance_type_earth" {
    default = "t2.micro"
    type = string
    description = "Instance type"
}

variable "instance_keypair_earth" {
    default = "valaxy-key"
    type = string
    description = "Key for the Servers"
}


variable  "earth_vpc_id" {}

variable "earth_subnet1_id" {}

#variable "earth_subnet1_id" {}