# Worker Node Security Group 
resource "aws_security_group" "worker_node_sg" {
  name        = "eks-earth"
  description = "Allow ssh inbound traffic"
  vpc_id      =  var.earth_vpc_id

  ingress {
    description      = "ssh access to public"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

   ingress {
    description      = "ssh access to public"
    from_port        = 30082
    to_port          = 30082
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

}
