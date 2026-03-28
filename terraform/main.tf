resource "google_compute_network" "clien-vpc" {
  name                    = "client-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "client-subnet" {
  name          = "client-subnet"
  region        = "us-central1"
  ip_cidr_range = "10.128.0.0/20"
  network       = google_compute_network.clien-vpc.id
}

resource "google_compute_firewall" "client-fw-ssh" {
  name = "fwrule-allow-ssh22"
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = google_compute_network.clien-vpc.id
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh-tag"]
}

resource "google_compute_firewall" "client-fw-http" {
  name = "fwrule-allow-http80"
  allow {
    ports    = ["80"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = google_compute_network.clien-vpc.id
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-webserve-tag"]
}

resource "google_compute_instance" "client-instance" {
  name         = "client-jenkins-instance"
  machine_type = "e2-micro"
  zone         = "us-central1-a"
  tags         = [tolist(google_compute_firewall.client-fw-http.target_tags)[0], tolist(google_compute_firewall.client-fw-ssh.target_tags)[0]]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.client-subnet.id
    access_config {

    }
  }
  metadata_startup_script = file("${path.module}/app-webserver-install.sh")
}
