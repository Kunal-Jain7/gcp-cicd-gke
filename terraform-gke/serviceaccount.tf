resource "google_service_account" "client-gke-sa" {
  account_id   = "${local.name}-client-sa"
  display_name = "${local.name} GKE Service Account"
}
