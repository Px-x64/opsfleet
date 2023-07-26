resource "aws_iam_policy" "pod-s3-policy" {
  name        = var.policy_name
  path        = "/"
  description = "Allow AWS EKS PODs to get a specify S3 Object"

  policy = file("${path.module}/policies/s3_policy.json")
  tags   = var.tags
}

resource "aws_iam_role" "pod-s3-role" {
  name                  = var.role_name
  path                  = "/"
  assume_role_policy    = data.template_file.role_trust_relationship.rendered
  force_detach_policies = false
  tags                  = var.tags
}

resource "aws_iam_role_policy_attachment" "main" {
  role       = aws_iam_role.pod-s3-role.name
  policy_arn = aws_iam_policy.pod-s3-policy.arn
}
