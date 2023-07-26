variable "aws_region" {
  type    = string
  default = "eu-west-1"
}

variable "k8s_namespace" {
  default = "default"
}

variable "role_name" {
  default = "s3-get-object-iam-role001"
}

variable "policy_name" {
  default = "s3-get-object-iam-policy001"
}

variable "eks_cluster_state_bucket" {
  default = ""
}

variable "eks_cluster_state_file" {
  default = ""
}

variable "tags" {
  default = {
    Terraform = "true"
  }
}
