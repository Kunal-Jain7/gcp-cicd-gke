data "terraform_remote_state" "gketerraformstate" {
  backend = "gcs"
  config = {
    bucket = "gketerraformstate"
    prefix = "terraform/statefile"
  }
}

data "google_container_cluster" "gke" {
  project  = var.project
  name     = data.terraform_remote_state.gketerraformstate.outputs.gke_cluster_name
  location = data.terraform_remote_state.gketerraformstate.outputs.gke_cluster_location
}

data "google_client_config" "default" {}

provider "kubernetes" {
  host  = "https://${data.google_container_cluster.gke.endpoint}"
  token = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.gke.master_auth.0.cluster_ca_certificate
  )
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "gke-gcloud-auth-plugin"
  }
}
