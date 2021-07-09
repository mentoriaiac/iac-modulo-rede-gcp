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

variable "firewall_allow" {
  description = "Lista de portas para permitir no firewall"
  type = list(object({
    protocol = string
    port     = list(number)
  }))
}

variable "mtu" {
  description = "Unidades maxmimas de unidades de transimissão em bytes. O valor minimo valido é 1460 e o maximo é 1500 bytes."
  type        = number
  default     = 1460
}
