locals {
  node_groups = {
    default = {
      instance_types = ["t2.micro"]
      capacity_type  = "ON_DEMAND"

      disk_size    = 50

      min_size     = 1
      max_size     = 4
      desired_size = 1
    }
  }
}
