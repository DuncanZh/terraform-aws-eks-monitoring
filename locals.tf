data "aws_eks_cluster" "cluster" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "cluster" {
  name = var.cluster_name
}

locals {
  host        = data.aws_eks_cluster.cluster.endpoint
  certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)
  token       = data.aws_eks_cluster_auth.cluster.token

  oidc_provider = data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer
}