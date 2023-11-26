/* 
   https://registry.terraform.io/providers/hashicorp/aws/2.42.0/docs/resources/eip

   https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
*/



resource "aws_eip" "demo_eip" {
  domain   = "vpc"
}



resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"


  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["${aws_eip.demo_eip.public_ip}/32"]
  }
    ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["${aws_eip.demo_eip.public_ip}/32"]
  }
 

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
