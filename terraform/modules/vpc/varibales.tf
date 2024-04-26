variable "availability_zone_1a" {
    default = "ap-south-1a"
    description = "Availability Zone for the VPC"
    type = string
}


variable "availability_zone_1b" {
    default = "ap-south-1b"
    description = "Availability Zone for the VPC"
    type = string
}


variable "map_public_ip_on_launch" {
    default = true
    type    = string
    description = "When an Instance Launchs add IP automatically"
}

