variable "aws_region" {
  type    = string
  default = "eu-west-1"
}

variable "name" {
  type    = string
  default = "eks-cluster"
}

variable "cluster_version" {
  type    = string
  default = "1.27"
}

variable "vpc_id" {
  type = string
  validation {
    condition     = (var.vpc_id != null)
    error_message = "Please provide VPC ID for the cluster"
  }
}

variable "subnets" {
  type = list(string)
  validation {
    condition     = (var.subnets != null)
    error_message = "Please provide a list of subnets for the cluster"
  }
}

variable "tags" {
  default = {
    Terraform = "true"
  }
}
