# Create EC2 instances 
resource "aws_instance" "valaxy_server" {
  ami             = var.instance_ami_valaxy 
  instance_type   = var.instance_type_valaxy
  subnet_id       = var.valaxy_subnet1_id
  security_groups = [aws_security_group.valaxy_sg.id]
  key_name        = var.instance_keypair_valaxy
  associate_public_ip_address = true  
  root_block_device {
    volume_size = 15
    volume_type = "gp2"
  }
  for_each = toset(["jenkins-master", "build-slave", "ansible"])
   tags = {
     Name = "${each.key}"
   }

  lifecycle {
  ignore_changes = [security_groups]
  }
}



# Create a security group allowing all traffic
resource "aws_security_group" "valaxy_sg" {
  name = "valaxy_sg"
  vpc_id = var.valaxy_vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # HTTP
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # SSH
  }


  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Jenkins
  }

    ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Jenkins
  }


}