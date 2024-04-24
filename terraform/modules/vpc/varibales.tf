variable "availability_zone" {
    default = "ap-south-1b"
    description = "Availability Zone for the VPC"
    type = string
}


variable "map_public_ip_on_launch" {
    default = true
    type    = string
    description = "When an Instance Launchs add IP automatically"
}

