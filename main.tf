locals {
  firewall_name       = format("%s-%s", var.project, var.vpc_name)
  _destination_ranges = var.direction == "INGRESS" ? var.destination_ranges : null
  _source_ranges      = var.direction == "EGRESS" ? var.source_ranges : null
  _source_tags        = var.direction == "EGRESS" ? var.source_tags : null
  }

resource "google_compute_network" "vpc_network" {
  project                 = var.project
  name                    = var.vpc_name
  auto_create_subnetworks = false
  mtu                     = var.mtu
}

resource "google_compute_subnetwork" "subnetworks" {
  for_each      = { for subnet in var.subnetworks : subnet.name => subnet }
  name          = each.value.name
  project       = var.project
  ip_cidr_range = each.value.ip_cidr_range
  region        = each.value.region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_router" "default" {
  name    = "${var.vpc_name}-router"
  project = var.project
  region  = var.region
  network = google_compute_network.vpc_network.id
}

resource "google_compute_router_nat" "default" {
  name                               = "${var.vpc_name}-nat-router"
  project                            = var.project
  region                             = var.region
  router                             = google_compute_router.default.name
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}


resource "google_compute_firewall" "firewall_rules" {
  name    = local.firewall_name
  project = var.project
  network = google_compute_network.vpc_network.id
  direction          = var.direction
  target_tags        = var.target_tags
  source_ranges      = local._source_ranges
  source_tags        = local._source_tags
  destination_ranges = local._destination_ranges
    
  dynamic "allow" {
    for_each = var.firewall_allow
    content {
      protocol = allow.value.protocol
      ports    = allow.value.port
    }
  }

}
