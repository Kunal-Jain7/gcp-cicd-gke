output "gke_cluster_name" {
  description = "GKE Cluster Name"
  value       = google_container_cluster.client-gke-cluster.name
}

output "gke_cluster_endpoint" {
  description = "GKE Cluster Endpoint"
  value       = google_container_cluster.client-gke-cluster.endpoint
}

output "gke_cluster_location" {
  description = "GKE Cluster Location"
  value       = google_container_cluster.client-gke-cluster.location
}
