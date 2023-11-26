provider "aws" {
 
}

resource "aws_eip" "demo_eip" {
  domain   = "vpc"
}

output "public-ip" {
  value = aws_eip.demo_eip.public_ip
}