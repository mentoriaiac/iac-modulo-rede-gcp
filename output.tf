output "vpc_id" {
  value     = google_compute_network.vpc_network.id
  sensitive = false
}


output "subnets_id" {
  value     = [for subnet in google_compute_subnetwork.subnetworks : subnet]
  sensitive = false
}
