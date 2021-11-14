module "network_gcp" {
  source      = "./.."
  project     = "mentoriaiac2"
  vpc_name    = "nomedavpc"
  direction   = "INGRESS"
  target_tags = ["web"]
  source_tags = ["web"]
  subnetworks = [
    {
      name          = "minhasubnet"
      ip_cidr_range = "10.0.0.0/16"
      region        = "us-central1"
    },
    {
      name          = "minhasubnet2"
      ip_cidr_range = "10.10.0.0/16"
      region        = "us-west1"
    }
  ] 
    firewall_allow = [
    {
      protocol = "tcp"
      port     = [443, 80]
    }
  ]
}


