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
