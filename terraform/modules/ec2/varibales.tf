variable "instance_ami_valaxy" {
    default = "ami-007020fd9c84e18c7"
    type = string
    description = "AMI for the Valaxy Servers"
}

variable "instance_type_valaxy" {
    default = "t2.micro"
    type = string
    description = "Instance type"
}

variable "instance_keypair_valaxy" {
    default = "valaxy-key"
    type = string
    description = "Key for the Servers"
}


variable  "valaxy_vpc_id" {}

variable "valaxy_subnet1_id" {}