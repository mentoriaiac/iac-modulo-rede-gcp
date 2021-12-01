variable "vpc_name" {
  description = "nome da vpc"
  type        = string
}

variable "project" {
  description = "O ID do projeto ao qual o recurso pertence."
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
    port     = list(string)
  }))
}

variable "mtu" {
  description = "Unidades maxmimas de unidades de transimissão em bytes. O valor minimo valido é 1460 e o maximo é 1500 bytes."
  type        = number
  default     = 1460
}

variable "region" {
  type        = string
  description = "Região na GCP onde os recursos serão criados."
  default     = "us-central1"
}

variable "direction" {
  type        = string
  description = "(Opcional) Direção do tráfego ao qual este firewall se aplica; o padrão é INGRESS. Nota: Para tráfego INGRESS, NÃO é suportado especificar destinationRanges; Para o tráfego EGRESS, NÃO há suporte para especificar sourceRanges OU sourceTags."
  default     = "INGRESS"
}

variable "target_tags" {
  type        = list(string)
  description = "(Opcional) Uma lista de tags de instância indicando conjuntos de instâncias localizadas na rede que podem fazer conexões de rede conforme especificado em permitido []. Se nenhum targetTags for especificado, a regra de firewall se aplica a todas as instâncias na rede especificada."
  default     = []
}

variable "source_tags" {
  type        = list(string)
  description = "(Opcional) Se as tags de origem forem especificadas, o firewall se aplicará apenas ao tráfego com IP de origem que pertence a uma tag listada nas tags de origem."
  default     = []
}

variable "destination_ranges" {
  type        = list(string)
  description = "(Opcional) Se intervalos de origem forem especificados, o firewall se aplicará apenas ao tráfego que possui endereço IP de origem nesses intervalos. Esses intervalos devem ser expressos no formato CIDR. Um ou ambos sourceRanges e sourceTags podem ser definidos."
  default     = []
}

variable "source_ranges" {
  type        = list(string)
  description = "(Opcional) Uma lista de tags de instância indicando conjuntos de instâncias localizadas na rede que podem fazer conexões de rede conforme especificado em permitido []. Se nenhum targetTags for especificado, a regra de firewall se aplica a todas as instâncias na rede especificada."
  default     = []
}
