module "eks_default" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.15"

  cluster_name    = "${var.name}-eks-cluster"
  cluster_version = var.cluster_version

  # EKS Addons
  cluster_addons = {
    #    aws-ebs-csi-driver = {}
    #    coredns            = {}
    kube-proxy = {}
    vpc-cni    = {}
  }

  vpc_id     = var.vpc_id
  subnet_ids = var.subnets

  eks_managed_node_groups = local.node_groups

  tags = var.tags
}
