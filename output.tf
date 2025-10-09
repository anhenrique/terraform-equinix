output "vapp_name" {
  description = "Nome do vApp criado (exposto pelo módulo infra_vapp)"
  value       = module.infra_vapp.vapp_name
}

output "vm_names" {
  description = "Nomes das VMs criadas pelo módulo"
  value       = module.infra_vapp.vm_names
}

output "vm_ids" {
  description = "IDs das VMs criadas pelo módulo"
  value       = module.infra_vapp.vm_ids
}
