module "iam_to_eks_01" {

  source                   = "../../modules/iam"
  eks_cluster_state_bucket = var.state_bucket
  eks_cluster_state_file   = var.state_key
  tags                     = var.tags

}
