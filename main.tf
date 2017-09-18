#
# DO NOT DELETE THESE LINES!
#
# Your AMI ID is:
#
#     ami-1d4e7a66
#
# Your subnet ID is:
#
#     subnet-27f55043
#
# Your security group ID is:
#
#     sg-e72efe94
#
# Your Identity is:
#
#     terraform-lion
#

terraform {
  backend "atlas" {
    name = "ericgreene/training"
  }
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_instance" "web" {
  count                  = "${var.num_webs}"
  ami                    = "ami-1d4e7a66"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-27f55043"
  vpc_security_group_ids = ["sg-e72efe94"]

  tags {
    "Identity" = "terraform-lion"
    "MyTag1"   = "tagtag"
    Name       = "web ${count.index+1}/${var.num_webs}"
  }
}
