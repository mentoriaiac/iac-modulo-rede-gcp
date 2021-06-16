variable "vpc_name" {
  description = "nome da vpc"
  default     = ""
}

variable "project" {
  description = "nome do projeto existente no google cloud"
  default     = ""
}

variable "subnet_name" {
  description = "nome da subnet a ser criado"
  default     = ""
}

variable "ip_cidr_range" {
  description = "range de ip em formato de bloco cidr 0.0.0.0/24"
  default     = ""
}

variable "region" {
  description = "região onde a subnet será criada"
  default     = ""
}
