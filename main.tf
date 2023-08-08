terraform {
  required_version = ">= 1.3.7"
  required_providers {
    aws = ">= 5.0"
  }
}

provider "aws" {
  profile                  = "default"
  shared_credentials_files = ["~/.aws/credentials"]
  region                   = "us-east-1"
}

module "ec2" {
  source    = "git@github.com:eduardoocarneiro/terraform-aws-ec2.git"
  int_type  = "t2.micro"
  int_names = "WEB"
  user_data = file("./files/userdata.sh")
  ami       = "ami-05fa00d4c63e32376"
}
