output "cluster_name" {
  description = "EKS cluster name"
  value       = module.eks_deployment_01.cluster_name
}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data required to communicate with the cluster"
  value       = module.eks_deployment_01.cluster_certificate_authority_data
}

output "cluster_endpoint" {
  description = "Endpoint for your Kubernetes API server"
  value       = module.eks_deployment_01.cluster_endpoint
}

output "cluster_oidc_issuer_url" {
  description = "The URL on the EKS cluster for the OpenID Connect identity provider"
  value       = module.eks_deployment_01.cluster_oidc_issuer_url
}

output "oidc_provider_arn" {
  description = "The ARN on the EKS cluster for the OpenID Connect identity provider"
  value       = module.eks_deployment_01.oidc_provider_arn
}

output "aws_region" {
  description = "AWS deployment region"
  value       = var.aws_region
}