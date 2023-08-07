resource "helm_release" "aws-cloudwatch-metrics" {
  name       = var.release_name
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-cloudwatch-metrics"
  version    = var.chart_version
  namespace  = kubernetes_namespace.namespace.metadata[0].name

  values = [
    local.values,
    local.schedule
  ]

  set {
    name  = "clusterName"
    value = var.cluster_name
  }

  set {
    name  = "serviceAccount.name"
    value = var.service_account_name
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = module.iam_role.iam_role_arn
  }
}