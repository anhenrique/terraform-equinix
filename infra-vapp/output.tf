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
  description = "Lista de endereços IP das instâncias na Equinix"
  # Observe o  logo após a palavra network
  value = [for vm in vcd_vapp_vm.vms : vm.network.ip]
}