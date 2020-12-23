
variable "ec2-key-pair" {
  type    = string
  default = "docker_key"
}

variable "ec2-instance-type" {
  type    = string
  default = "t3a.nano"
}

variable "subnetId" {
  type    = string
}

variable "security_groups" {
  type = list(string)
}