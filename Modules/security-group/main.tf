provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "my-sg" {
  vpc_id = var.vpc_id
  name = var.sg_name

  ingress {
        description = "allow ssh"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "allow http"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        description = "outbound allow all trafice"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    } 

    tags = {
        Name = var.sg_name
    }
}
