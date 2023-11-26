
resource "aws_instance" "myec2" {
   ami = "ami-0230bd60aa48260c6"
   instance_type = var.instancetype
}


/*
terraform plan -var="instancetype=t2.small"
terraform plan -var-file="custom.tfvars"
*/