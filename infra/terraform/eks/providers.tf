provider "aws" {
  region = "eu-west-3"
}

terraform{
  backend "s3" {
    bucket = "terraform-bucket-dna"
    key = "eks.tfstate"
     region = "eu-west-3"
  }
}

# Using these data sources allows the configuration to be
# generic for any region.
data "aws_region" "current" {}

# Declare the data source
data "aws_availability_zones" "available" {
  state = "available"
}
