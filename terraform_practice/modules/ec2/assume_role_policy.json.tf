
  variable "assume_role_policy" {
    type = string
    description = "JSON string for the assume role policy."
    default = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Effect": "Allow",
        "Principal": {
          "Service": "ec2.amazonaws.com"
        }
      }
    ]
  }
  EOF
  }
  
  resource "aws_iam_role" "ec2_instance" {
    name               = var.role_name
    assume_role_policy = var.assume_role_policy
  }
  
  