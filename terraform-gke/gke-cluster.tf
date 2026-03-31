resource "google_container_cluster" "client-gke-cluster" {
  name                     = "${local.name}-gke-cluster"
  location                 = var.region
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.client-vpc.self_link
  subnetwork = google_compute_subnetwork.client-subnet.self_link

  deletion_protection = false

  node_config {
    machine_type = "e2-medium"

    disk_size_gb = 20
    disk_type    = "pd-standard"

    preemptible = true
  }
}
