variable "gcp_project" {
  description = "Project for deploying the Resourses"
  type        = string
  default     = "learning-gcp-project-2026"
}

variable "gcp_region" {
  description = "Region where the resourses needs to be deployed"
  type        = string
  default     = "us-central1"
}

variable "instance_type" {
  description = "Type of EC2 instance that needs to be deployed"
  type        = string
  default     = "e2-micro"
}
