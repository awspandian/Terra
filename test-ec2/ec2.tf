terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.26.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "myec2" {
   ami = "ami-0cd601a22ac9e6d79"
   instance_type = "t2.micro"
}