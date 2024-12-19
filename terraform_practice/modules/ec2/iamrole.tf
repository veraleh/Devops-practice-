

resource "aws_iam_role" "iam_role" {
  name               = var.role_name
  assume_role_policy = var.assume_role_policy
}

resource "aws_iam_role_policy" "role_policy" {
  role   = aws_iam_role.iam_role.name
  name   = var.policy_name
  policy = var.policy_type
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = var.ec2_instance_profile_name
  role = aws_iam_role.iam_role.name

}
