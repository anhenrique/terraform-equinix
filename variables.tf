variable "vcd_url" {
  type        = string
  description = "URL base do vCD (ex: https://portal/api)"
}

variable "vcd_org" {
  type        = string
  description = "Organização no vCD"
}

variable "vcd_vdc" {
  type        = string
  description = "VDC dentro da organização"
}

variable "vcd_api_token" {
  type        = string
  description = "Token de API para autenticação"
  sensitive   = true
}

variable "allow_unverified_ssl" {
  type        = bool
  description = "Permitir certificados SSL não verificados"
  default     = true
}

variable "vapp_catalog" {
  type        = string
  description = "Catálogo que contém a template"
}

variable "template_name" {
  type        = string
  description = "Nome da template dentro do catálogo"
}

variable "vapp_network" {
  type        = string
  description = "Rede da organização para conectar VMs"
}

variable "vapp_name" {
  type        = string
  description = "Nome do vApp"
}

variable "vm_numbers" {
  type        = number
  description = "Quantidade de VMs a criar"

}

#variable "vm_name_prefix" {
#  type        = string
#  description = "Prefixo para nome das VMs"
#}

variable "memory" {
  type        = number
  description = "RAM por VM (MB)"
  default     = 4096
}

variable "cpus" {
  type        = number
  description = "Número de vCPUs por VM"
  default     = 2
}

variable "cpu_cores" {
  type        = number
  description = "Cores por CPU"
  default     = 1
}

variable "force_customization" {
  type        = bool
  description = "Forçar customização da VM"
  default     = true
}
variable "default_password" {
  type        = string
  description = "Senha padrão para VMs"
  sensitive   = true
}

variable "server_names" {
  type = list(string)
  description = "Lista de servidores criados de acordo com o .tfvars do CI/CD"
}

variable "storage_profile" {
  type        = string
  description = "Política de disco da VM (ex: EHC-DM-VHD, Tier 2, etc.)"
}