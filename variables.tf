# Auth

variable "profile" {
  type        = string
  description = "AWS profile."
}

# Settings

variable "region" {
  type        = string
  description = "AWS region."
}

variable "cluster_name" {
  type        = string
  description = "Cluster name."
}

variable "enable_fluent_bit" {
  type        = bool
  description = "Enable fluent Bit to collect logs."
}

variable "enable_aws_cloudwatch_metrics" {
  type        = bool
  description = "Enable AWS Cloudwatch Metrics to collect metrics."
}

# Optional

# Fluent Bit

variable "fluent_bit_release_name" {
  type        = string
  default     = "fluent-bit"
  description = "Release name."
}

variable "fluent_bit_chart_version" {
  type        = string
  default     = "0.37.0"
  description = "Chart version."
}

variable "fluent_bit_namespace" {
  type        = string
  default     = "fluent-bit"
  description = "Namespace."
}

variable "fluent_bit_service_account_name" {
  type        = string
  default     = "fluent-bit-sa"
  description = "Service account name."
}

variable "fluent_bit_use_iam_role_name_prefix" {
  type        = bool
  default     = true
  description = "Use the role name as a prefix followed by the cluster name."
}

variable "fluent_bit_iam_role_name" {
  type        = string
  default     = "EKSFluentBitRole-"
  description = "Role name or role name prefix."
}

variable "fluent_bit_values_yaml" {
  type        = string
  default     = null
  description = "values.yaml passed to helm. This override the default values."
}

variable "fluent_bit_schedule_yaml" {
  type        = string
  default     = null
  description = "schedule.yaml passed to helm. This override the default toleration setup."
}

variable "fluent_bit_read_from_head" {
  type        = bool
  default     = false
  description = "Read logs generated before fluent bit is deployed."
}

# AWS Cloudwatch Metrics

variable "aws_cloudwatch_metrics_release_name" {
  type        = string
  default     = "aws-cloudwatch-metrics"
  description = "Release name."
}

variable "aws_cloudwatch_metrics_chart_version" {
  type        = string
  default     = "0.0.9"
  description = "Chart version."
}

variable "aws_cloudwatch_metrics_namespace" {
  type        = string
  default     = "aws-cloudwatch-metrics"
  description = "Namespace."
}

variable "aws_cloudwatch_metrics_service_account_name" {
  type        = string
  default     = "aws-cloudwatch-metrics-sa"
  description = "Service account name."
}

variable "aws_cloudwatch_metrics_use_iam_role_name_prefix" {
  type        = bool
  default     = true
  description = "Use the role name as a prefix followed by the cluster name."
}

variable "aws_cloudwatch_metrics_iam_role_name" {
  type        = string
  default     = "EKSCloudwatchMetricsRole-"
  description = "Role name or role name prefix."
}

variable "aws_cloudwatch_metrics_values_yaml" {
  type        = string
  default     = null
  description = "values.yaml passed to helm. This override the default values."
}

variable "aws_cloudwatch_metrics_schedule_yaml" {
  type        = string
  default     = null
  description = "schedule.yaml passed to helm. This override the default toleration setup."
}

variable "aws_cloudwatch_metrics_containerd_sock_path" {
  type        = string
  default     = "/run/dockershim.sock"
  description = "AWS Cloudwatch Metrics containerd sock path."
}