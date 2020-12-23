data "aws_ami" "latest-amazon-ami" {
  most_recent = true
  owners      = ["amazon"] # Canonical

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "myec2" {
  ami           = data.aws_ami.latest-amazon-ami.id
  instance_type = var.ec2-instance-type
  key_name      = var.ec2-key-pair
  subnet_id     = var.subnetId
  #  associate_public_ip_address = true
  security_groups =var.security_groups
  tags = {
    Name = "ec2-damien"
  }
}


resource "aws_eip" "myec2Eip" {
  vpc = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.myec2.id
  allocation_id = aws_eip.myec2Eip.id
}
