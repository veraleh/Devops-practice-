variable "region" {
  type    = string
  default = "eu-north-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_a_cidr" {
  description = "CIDR block for public subnet A"
  default     = "10.0.1.0/24"
}

variable "public_subnet_b_cidr" {
    description = "CIDR block for public subnet B"
    default = "10.0.3.0/24"
}

variable "private_subnet_b_cidr" {
    description = "CIDR block for private subnet B"
    default = "10.0.4.0/24"
}

variable "private_subnet_a_cidr" {
    description = "CIDR block for private subnet A"
    default = "10.0.2.0/24"
}

variable "vpc_name" {
    type        = string
    description = "Default tags to apply to resources"
    default = "Example_VPC"
    
}

variable "public_subnet_a_name" {
    type = string
    description = "public subnet name A here"
    default = "Subnet_A"
  
}

variable "aws_internet_gateway_name" {
    type = string
    description = ""
    default = "Example"
  
}

variable "rtb_cidr" {
    type = string
    default = "0.0.0.0/0"
  
}

variable "aws_route_table_name" {
    type = string
    description = ""
    default = "Example"
  
}

variable "public_subnet_b_name" {
    type = string
    description = "public subnet name B here"
    default = "subnet_B"
  
}

variable "private_subnet_1" {
    type = string
    description = "private subnet 1"
    default = "0.0.0.0/0"
  
}

variable "private-subnet-1" {
    type = string
    description = "tag"
    default = "p.sub"
  
}

variable "private-subnet-2" {
    type = string
    description = "tags"
    default = "p.sub 2"
  
}

    variable "gw_nat_1" {
        type = string
        description = "tags"
        default = "gw"
      
    }

     variable "gw_nat_2" {
        type = string
        description = "tags"
        default = "gw"
      
    }