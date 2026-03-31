resource "google_container_node_pool" "client-nodepool" {
  name       = "${local.name}-gke-nodepool"
  location   = var.region
  cluster    = google_container_cluster.client-gke-cluster.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = var.machine_type

    disk_type    = "pd-standard"
    disk_size_gb = 20

    service_account = google_service_account.client-gke-sa.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    tags = [tolist(google_compute_firewall.client-fw-ssh.target_tags)[0]]
  }
}
