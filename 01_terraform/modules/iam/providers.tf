provider "aws" {
  region = var.aws_region
}

terraform {
  required_version = "~> 1.5.3"
  required_providers {
    aws = "~> 5"
    tls = "~> 3"
  }
}

provider "kubernetes" {
  host                   = data.terraform_remote_state.eks_cluster.outputs.cluster_endpoint
  cluster_ca_certificate = base64decode(data.terraform_remote_state.eks_cluster.outputs.cluster_certificate_authority_data)
  load_config_file       = false
}
