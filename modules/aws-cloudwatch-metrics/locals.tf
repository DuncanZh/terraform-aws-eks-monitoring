data "aws_region" "current" {}

locals {
  iam_role_name = var.use_iam_role_name_prefix ? "${var.iam_role_name}${var.cluster_name}" : var.iam_role_name
}