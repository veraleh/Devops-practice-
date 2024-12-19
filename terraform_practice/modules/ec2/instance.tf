provider "aws" {
    region = eu-north-1
  
}

resource "aws_instance" "ec2_instance" {
    ami = "ami-02df5cb5ad97983ba"
    instance_type = t3.micr0

    tags = {
        name="my_ec2_instance"
    }
  
}

