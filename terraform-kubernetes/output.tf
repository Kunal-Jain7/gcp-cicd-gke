output "nginxapp_lb_ip" {
  value = kubernetes_service_v1.nginx_lb_svc.status[0].load_balancer[0].ingress[0].ip
}

output "gke_cluster_details" {
  value = {
    gke_endpoint               = data.google_container_cluster.gke.endpoint
    gke_cluster_ca_certificate = data.google_container_cluster.gke.master_auth.0.cluster_ca_certificate
  }
}
