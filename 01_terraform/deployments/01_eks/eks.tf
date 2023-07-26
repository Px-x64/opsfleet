module "eks_deployment_01" {

  source  = "../../modules/eks"
  name    = var.name
  vpc_id  = var.vpc_id
  subnets = var.subnets
  tags    = var.tags

}
