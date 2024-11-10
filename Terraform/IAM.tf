# Define the AWS provider
provider "aws" {
  region = "us-east-1"  
}

resource "aws_iam_user" "revanthuser" {
  name = "example-user"
}

resource "aws_iam_user_policy" "example_user_policy" {
  name = "example-user-policy"
  user = aws_iam_user.revanthuser.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "s3:ListBucket"
        Resource = "arn:aws:s3:::example-bucket"
      },
      {
        Effect = "Allow"
        Action = "s3:GetObject"
        Resource = "arn:aws:s3:::example-bucket/*"
      }
    ]
  })
}

resource "aws_iam_access_key" "example_access_key" {
  user = aws_iam_user.revanthuser.name
}
