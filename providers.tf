provider "aws" {
  profile = var.profile
  region  = var.region
}

provider "kubernetes" {
  host                   = local.host
  cluster_ca_certificate = local.certificate
  token                  = local.token
}

provider "helm" {
  kubernetes {
    host                   = local.host
    cluster_ca_certificate = local.certificate
    token                  = local.token
  }
}