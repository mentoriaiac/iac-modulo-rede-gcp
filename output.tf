output "vpc_id" {
  description = "Retorna o id da VPC criada"
  value       = google_compute_network.vpc_network.id
  sensitive   = false
}


output "subnets" {
  description = "Retorna uma lista de objetos com os atributos das subnets criadas"
  value       = [for subnet in google_compute_subnetwork.subnetworks : subnet]
  sensitive   = false
}
