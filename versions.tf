terraform {
  required_version = ">= 1.5.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.10.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.22.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = " >= 2.10.1"
    }
  }
}