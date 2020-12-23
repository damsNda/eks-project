resource "aws_vpc" "app_vpc" {
  cidr_block = var.cidr_vpc
  tags = {
    Name = "terraform_vpc"
  }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.app_vpc.id

  tags = {
    Name = "gatewayInternet"
  }
}

resource "aws_subnet" "public_subnet1" {
  vpc_id            = aws_vpc.app_vpc.id
  cidr_block        = cidrsubnet(var.cidr_vpc, 4, 1)
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "tf-example"
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id            = aws_vpc.app_vpc.id
  cidr_block        = cidrsubnet(var.cidr_vpc, 4, 2)
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "tf-example"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.app_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "main"
  }
}

resource "aws_route_table_association" "public_subnet1_rt_association" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet2_rt_association" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_security_group" "ssh_allow_from_admin" {
  name        = "ssh_allow_from_admin"
  description = "Allow SSH from admin"
  vpc_id      = aws_vpc.app_vpc.id

  ingress {
    description = "Admin SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.admins_workstation
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.admins_workstation
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.admins_workstation
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "ssh_allow_from_admin"
  }
}