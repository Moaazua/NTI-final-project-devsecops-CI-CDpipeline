module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = ">= 18.0"

  cluster_name    = var.eks_cluster_name
  cluster_version = var.eks_version
  vpc_id          = var.vpc_id
  subnets         = var.public_subnet_ids



  tags = var.common_tags
}

