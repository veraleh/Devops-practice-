variable "instance_type" {
type = string
description = "this is the ec2 instance type in aws" 
}

variable "instance_name" {
type = string
description = "this is the ec2 instance name in aws" 
}

variable "role_name" {
  type = string
  description = "This is name of the IAM role"
}

# variable "assume_role_policy" {
#   type = string
#   description = "describes the profile that the role can trust"
#   default = null
# }

variable "policy_name" {
  type = string
  description = "Name of the policy"

  
}

variable "policy_type" {
  type = string
  description = "policy type"
  default = null
  
}

variable "ec2_instance_profile_name" {
  type = string

  
}

variable "vpc_id" {
      type = string
      
    }

    variable "subnet_id" {
      type = string
      
    }