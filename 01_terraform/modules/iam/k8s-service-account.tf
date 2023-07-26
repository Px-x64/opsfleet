resource "kubernetes_service_account" "k8s-sa" {
  metadata {
    name      = var.role_name
    namespace = var.k8s_namespace
    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.pod-s3-role.arn
    }
  }
  automount_service_account_token = true
}
