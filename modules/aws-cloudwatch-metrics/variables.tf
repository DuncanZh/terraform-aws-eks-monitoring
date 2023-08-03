# AWS Cloudwatch Metrics

# Required

variable "cluster_name" {
  type        = string
  description = "Cluster name."
}

variable "oidc_provider" {
  type        = string
  description = "OIDC provider url of the cluster."
}

# Optional

variable "release_name" {
  type        = string
  default     = "aws-cloudwatch-metrics"
  description = "Release name."
}

variable "chart_version" {
  type        = string
  default     = "0.0.9"
  description = "Chart version."
}

variable "namespace" {
  type        = string
  default     = "aws-cloudwatch-metrics"
  description = "Namespace."
}

variable "service_account_name" {
  type        = string
  default     = "aws-cloudwatch-metrics-sa"
  description = "Service account name."
}

variable "use_iam_role_name_prefix" {
  type        = bool
  default     = true
  description = "Use the role name as a prefix followed by the cluster name."
}

variable "iam_role_name" {
  type        = string
  default     = "EKSCloudwatchMetricsRole-"
  description = "Role name or role name prefix."
}

variable "containerd_sock_path" {
  type        = string
  default     = "/run/dockershim.sock"
  description = "AWS Cloudwatch Metrics containerd sock path."
}