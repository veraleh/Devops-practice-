output "instance_id" {
    value = module.ec2.ec2_instance_id
  
}

output "vpc_id" {
    value = module.vpc.vpc_id
  
}

output "public_subnet_a_id" {
    value = module.vpc.public_subnet_a_id
  
}

output "public_subnet_b_id" {
    value = module.vpc.public_subnet_b_id
  
}