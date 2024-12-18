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