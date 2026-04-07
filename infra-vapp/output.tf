output "vapp_name" {
  description = "Nome do vApp criado"
  value       = vcd_vapp.my_vapp.name
}

output "vm_names" {
  description = "Nomes das VMs criadas"
  value       = [for vm in vcd_vapp_vm.vms : vm.name]
}

output "vm_ids" {
  description = "IDs das VMs criadas"
  value       = [for vm in vcd_vapp_vm.vms : vm.id]
}

output "vapp_vm_ips" {
  description = "IPs das máquinas virtuais"
  # Usamos um loop 'for' para pegar o IP da primeira rede de cada VM
  value = [for vm in vcd_vapp_vm.vms : vm.network.ip]
}