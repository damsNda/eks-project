module "ec2" {
  source = "./modules/ec2module"
  ec2-instance-type = "t3a.small"
  ec2-key-pair = "docker_key"
  subnetId = aws_subnet.public_subnet1.id
  security_groups = [aws_security_group.ssh_allow_from_admin.id]
}