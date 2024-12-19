module "ec2" {
  source = "./terraform_practice/modules/ec2"
  role_name = var.role_name
  instance_name = var.instance_name
  instance_type = var.instance_type
  policy_name = var.policy_name
  ec2_instance_profile_name = var.ec2_instance_profile_name
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

  policy_type = file("policy.json")
        

}