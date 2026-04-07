variable "vapp_name" {
  type        = string
  description = "Nome do vApp a ser criado"
}

variable "vapp_network" {
  type        = string
  description = "Rede da organização para conectar as VMs"
}

variable "vapp_catalog" {
  type        = string
  description = "Catálogo que contém a template"
}

variable "template_name" {
  type        = string
  description = "Nome exato da template no catálogo"
}

variable "vm_name_prefix" {
  type        = string
  description = "Prefixo usado para nomear as VMs"
}

variable "vm_numbers" {
  type        = number
  description = "Quantidade de VMs a criar"
}

variable "memory" {
  type        = number
  default     = 4096
}

variable "cpus" {
  type        = number
  default     = 2
}

variable "cpu_cores" {
  type        = number
  default     = 1
}

variable "force_customization" {
  type        = bool
  default     = false
}

# Nova variável para senha fixa
variable "default_password" {
  type        = string
  description = "Senha que será definida nas VMs via cloud-init ou script"
  sensitive   = true
}
variable "vcd_org" {
  type        = string
  description = "Organização vCD (para uso no módulo)"
}

variable "vcd_vdc" {
  type        = string
  description = "VDC dentro da org (para uso no módulo)"
}

variable "server_names" {
  type = list(string)
  description = "Lista de servidores criados de acordo com o .tfvars do CI/CD"
}