variable "vpc_name" {
  description = "nome da vpc"
  type        = string
}

variable "project" {
  description = "nome do projeto existente no google cloud"
  type        = string
}

variable "subnetworks" {
  description = "Lista do objeto de network"
  type = list(object({
    name          = string
    ip_cidr_range = string
    region        = string
  }))
}

variable "firewall_allow_tcp_ports" {
  description = "Lista de portas TCP"
  type        = list(number)
}

variable "firewall_allow_udp_ports" {
  description = "Lista de portas UDP"
  type        = list(number)
  default     = []
}

variable "mtu" {
  description = "Unidades maxmimas de unidades de transimissão em bytes. O valor minimo valido é 1460 e o maximo é 1500 bytes."
  type        = number
  default     = 1460
}
