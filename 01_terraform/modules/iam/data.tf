data "terraform_remote_state" "eks_cluster" {
  backend = "s3"
  config = {
    bucket = var.eks_cluster_state_bucket
    key    = var.eks_cluster_state_file
    region = var.aws_region
  }
}

data "template_file" "role_trust_relationship" {
  template = file("${path.module}/policies/role_trust_relationship.json.tmpl")
  vars = {
    oidc_arn      = data.terraform_remote_state.eks_cluster.outputs.oidc_provider_arn
    oidc_url      = data.terraform_remote_state.eks_cluster.outputs.cluster_oidc_issuer_url
    k8s_namespace = var.k8s_namespace
    role_name     = var.role_name
  }
}
