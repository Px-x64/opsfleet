provider "aws" {
  region = var.aws_region
}

terraform {
  required_version = "~> 1.5.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5"
    }
  }

  backend "s3" {
    bucket = "opsfleet-test-bucket"
    key    = "terraform_backends/01_eks/terraform.tfstate"
    region = "eu-west-1"
  }
}
