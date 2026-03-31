terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.33.0"
    }
  }
  required_version = ">= 1.7.5"
  backend "gcs" {
    bucket = "gketerraformstate"
    prefix = "terraform/statefile"
  }
}

provider "google" {
  region  = var.region
  project = var.project
}
