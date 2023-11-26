terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.26.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_iam_user" "test" {
  name = "prod"
  path = "/system/"

}

resource "aws_iam_user_policy" "test-policy" {
  name = "t-policy"
  user = aws_iam_user.test.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}