data "aws_ami" "latest_ami" {
    most_recent = true
    owners = ["amazon"]

    filter {
      name = "name"
      values = ["amzn2-ami-hvm*"]
    }
  
}

resource "aws_instance" "ec2_instance" {
    ami = data.aws_ami.latest_ami.id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
    subnet_id = var.subnet_id

  tags = {
    Name = var.instance_name
  }
}
