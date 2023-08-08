data "aws_region" "current" {}

locals {
  iam_role_name = var.use_iam_role_name_prefix ? "${var.iam_role_name}${var.cluster_name}" : var.iam_role_name
}

locals {
  configs = {
    CLUSTER_NAME       = var.cluster_name
    AWS_REGION         = data.aws_region.current.name
    READ_FROM_HEAD     = var.read_from_head ? "On" : "Off"
    READ_FROM_TAIL     = var.read_from_head ? "Off" : "On"
    LOG_RETENTION_DAYS = var.log_retention_days
  }
  values = var.values_yaml == null ? templatefile("${path.module}/values.yaml", local.configs) : var.values_yaml

  schedule = var.schedule_yaml == null ? file("${path.module}/schedule.yaml") : var.schedule_yaml
}