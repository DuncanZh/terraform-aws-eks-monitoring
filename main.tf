module "fluent-bit" {
  source = "./modules/fluent-bit"

  count = var.enable_fluent_bit ? 1 : 0

  cluster_name  = var.cluster_name
  oidc_provider = local.oidc_provider

  release_name             = var.fluent_bit_release_name
  chart_version            = var.fluent_bit_chart_version
  namespace                = var.fluent_bit_namespace
  service_account_name     = var.fluent_bit_service_account_name
  use_iam_role_name_prefix = var.fluent_bit_use_iam_role_name_prefix
  iam_role_name            = var.fluent_bit_iam_role_name

  values_yaml    = var.fluent_bit_values_yaml
  read_from_head = var.fluent_bit_read_from_head
}

module "aws-cloudwatch-metrics" {
  source = "./modules/aws-cloudwatch-metrics"

  count = var.enable_aws_cloudwatch_metrics ? 1 : 0

  cluster_name  = var.cluster_name
  oidc_provider = local.oidc_provider

  release_name             = var.aws_cloudwatch_metrics_release_name
  chart_version            = var.aws_cloudwatch_metrics_chart_version
  namespace                = var.aws_cloudwatch_metrics_namespace
  service_account_name     = var.aws_cloudwatch_metrics_service_account_name
  use_iam_role_name_prefix = var.aws_cloudwatch_metrics_use_iam_role_name_prefix
  iam_role_name            = var.aws_cloudwatch_metrics_iam_role_name

  containerd_sock_path = var.aws_cloudwatch_metrics_containerd_sock_path
}