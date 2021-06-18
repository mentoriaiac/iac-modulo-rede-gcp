variable "vpc_name" {
  description = "nome da vpc"
  default     = ""
}

variable "project" {
  description = "nome do projeto existente no google cloud"
  default     = ""
}

variable "subnetworks" {
  description = "Lista do objeto de network"
  type = list(object({
    name          = string
    ip_cidr_range = string
    region        = string
  }))
}

variable "firewall_name" {
  description = ""
  default     = ""
}

variable "firewall_allow_tcp_ports" {
  description = "Lista do objeto de firewall"
  default = []
}

 variable "firewall_allow_udp_ports" {
  description = "Lista do objeto de firewall"
  default = []
}
