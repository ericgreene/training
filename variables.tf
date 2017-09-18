# variables
variable "aws_access_key" {}

variable "command" {
  default = "echo 'hello world'"
}

variable "aws_secret_key" {}

variable "aws_region" {
  default = "us-east-1"
}

variable "num_webs" {
  default = 2
}
