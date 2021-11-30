module "network_gcp" {
  source      = "github.com/lipenodias/iac-modulo-rede-gcp.git"
  project     = var.project
  vpc_name    = "rede-mentoria"
  direction   = "INGRESS"
  target_tags = ["nomad"]
  source_tags = ["nomad"]
  subnetworks = [
    {
      name          = "subnet-nomad"
      ip_cidr_range = "10.0.0.0/16"
      region        = "us-central1"
    }
  ]

  firewall_allow = [
    {
      protocol = "tcp"
      port     = [22, 4646, 4647, 4648, 20000 - 32000]
    }
  ]
}

