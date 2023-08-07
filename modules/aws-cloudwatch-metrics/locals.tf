data "aws_region" "current" {}

locals {
  iam_role_name = var.use_iam_role_name_prefix ? "${var.iam_role_name}${var.cluster_name}" : var.iam_role_name
}

locals {
  values = var.values_yaml == null ? file("${path.module}/values.yaml") : var.values_yaml

  schedule = var.schedule_yaml == null ? file("${path.module}/schedule.yaml") : var.schedule_yaml
}