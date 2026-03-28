terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.33.0"
    }
  }
  required_version = ">= 1.7.5"
  backend "gcs" {
    bucket = "kunalgcpterraformstate"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = "learning-gcp-project-2026"
  region  = "us-central1"
}

