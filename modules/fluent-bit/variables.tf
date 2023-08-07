# Fluent Bit

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
  default     = "fluent-bit"
  description = "Release name."
}

variable "chart_version" {
  type        = string
  default     = "0.37.0"
  description = "Chart version."
}

variable "namespace" {
  type        = string
  default     = "fluent-bit"
  description = "Namespace."
}

variable "service_account_name" {
  type        = string
  default     = "fluent-bit-sa"
  description = "Service account name."
}

variable "use_iam_role_name_prefix" {
  type        = bool
  default     = true
  description = "Use the role name as a prefix followed by the cluster name."
}

variable "iam_role_name" {
  type        = string
  default     = "EKSFluentBitRole-"
  description = "Role name or role name prefix."
}

variable "values_yaml" {
  type        = string
  default     = null
  description = "values.yaml passed to helm. This override the default values."
}

variable "schedule_yaml" {
  type        = string
  default     = null
  description = "schedule.yaml passed to helm. This override the default toleration setup."
}

variable "read_from_head" {
  type        = bool
  default     = false
  description = "Read logs generated before fluent bit is deployed."
}