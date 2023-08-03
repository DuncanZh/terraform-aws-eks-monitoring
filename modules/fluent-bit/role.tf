data "aws_iam_policy" "this" {
  name = "CloudWatchAgentServerPolicy"
}

module "iam_role" {
  source = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"

  create_role                    = true
  role_name                      = local.iam_role_name
  provider_url                   = var.oidc_provider
  role_policy_arns               = [data.aws_iam_policy.this.arn]
  oidc_fully_qualified_audiences = ["sts.amazonaws.com"]
  oidc_fully_qualified_subjects  = ["system:serviceaccount:${var.namespace}:${var.service_account_name}"]
}