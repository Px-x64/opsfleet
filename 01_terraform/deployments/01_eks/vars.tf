variable "aws_region" {
  type    = string
  default = "eu-west-1"
}

variable "state_bucket" {
  default = "opsfleet-test-bucket"
}

variable "state_key" {
  default = "terraform_backends/01_eks/terraform.tfstate"
}

variable "name" {
  default = "test"
}

variable "cluster_version" {
  type    = string
  default = "1.27"
}

variable "vpc_id" {
  default = "vpc-0722f9b889d3c3e9d"
}

variable "subnets" {
  default = ["subnet-06f880ab16195a712", "subnet-08e7805a565ab1d0d", "subnet-0031013b426d37d3f"]
}
