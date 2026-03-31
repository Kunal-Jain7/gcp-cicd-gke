terraform {
  required_version = ">= 1.7.5"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.33.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.31"
    }
  }
  backend "gcs" {
    bucket = "kubernetesterraform"
    prefix = "terraform/statefile"
  }
}
