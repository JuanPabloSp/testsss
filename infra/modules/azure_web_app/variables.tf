variable "prefix" {
  description = "El prefijo para el nombre de los recursos"
  type        = string
  default     = "az400lab"
}

variable "environment" {
  description = "El entorno de despliegue (dev, prod, etc.)"
  type        = string
}

variable "location" {
  description = "La región de Azure donde se desplegarán los recursos"
  type        = string
}
