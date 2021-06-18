resource "google_compute_network" "vpc_network" {
  project                 = var.project
  name                    = var.vpc_name
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "subnetworks" {
  for_each      = { for subnet in var.subnetworks : subnet.name => subnet }
  name          = each.value.name
  project       = var.project
  ip_cidr_range = each.value.ip_cidr_range
  region        = each.value.region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_firewall" "firewall" {
  name    = var.firewall_name
  project = var.project
  network = google_compute_network.vpc_network.id
  allow {
    protocol = "tcp"
    ports    = var.firewall_allow_tcp_ports
  }

  allow {
    protocol = "udp"
    ports    = var.firewall_allow_udp_ports
  }


}


