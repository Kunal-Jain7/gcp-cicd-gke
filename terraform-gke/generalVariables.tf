locals {
  env    = var.environment
  owners = var.businees_unit
  name   = "${var.businees_unit}-${var.environment}"
  common_tags = {
    owners      = local.owners
    environment = local.env
  }
}

variable "businees_unit" {
  type    = string
  default = "mlops"
}

variable "environment" {
  type    = string
  default = "dops"
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "project" {
  type    = string
  default = "learning-gcp-project-2026"
}

variable "machine_type" {
  type    = string
  default = "e2-medium"
}
