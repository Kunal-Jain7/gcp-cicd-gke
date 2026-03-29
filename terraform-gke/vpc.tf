resource "google_compute_network" "client-vpc" {
  name                    = "${local.name}-client-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "client-subnet" {
  name                     = "${local.name}-client-subnet"
  network                  = google_compute_network.client-vpc.id
  ip_cidr_range            = "10.128.0.0/20"
  region                   = var.region
  private_ip_google_access = true
}
