output "vapp_name" {
  description = "Nome do vApp criado"
  value       = vcd_vapp.my_vapp.name
}

output "vm_names" {
  description = "Nomes das VMs criadas"
  value       = [for vm in vcd_vm.vms : vm.name]
}

output "vm_ids" {
  description = "IDs das VMs criadas"
  value       = [for vm in vcd_vm.vms : vm.id]
}

output "vapp_vm_ips" {
  description = "Lista de endereços IP das instâncias na Equinix"
  # Observe o  logo após a palavra network
  value = [for vm in vcd_vm.vms : vm.network[0].ip]
}

output "vapp_vm_ips_concatenados" {
  description = "Lista de VMs e seus respectivos IPs na Equinix"
  # Observe o uso do índice  que corrigimos anteriormente
  value = [for vm in vcd_vm.vms : "${vm.name}: ${vm.network[0].ip}"]
}

