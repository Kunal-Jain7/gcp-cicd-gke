output "vm_instance_id" {
  description = "ID of the VM instance"
  value       = google_compute_instance.client-instance.id
}

output "vm_external_ip" {
  description = "External IP of the Instance"
  value       = google_compute_instance.client-instance.network_interface.0.access_config.0.nat_ip
}
