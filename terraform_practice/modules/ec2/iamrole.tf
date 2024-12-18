variable "role_name" {
  type = string
  description = "This is the name of the IAM role"
}

resource "aws_iam_role" "ec2_instance" {
  name               = var.role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}
