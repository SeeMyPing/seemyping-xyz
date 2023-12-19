terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
    }
  }
  required_version = ">= 0.13"
  backend "s3" {
    bucket                      = "tfstates-ahbai9r"
    key                         = "seemyping-xyz.tfstate"
    region                      = "fr-par"
    endpoints = {
      s3  = "https://s3.fr-par.scw.cloud"
    }
    skip_credentials_validation = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
  }
}

provider "scaleway" {
    project_id = var.project_id
  zone   = "fr-par-1"
  region = "fr-par"
}