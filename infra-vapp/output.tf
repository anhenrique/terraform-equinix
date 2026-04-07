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
  description = "IPs das máquinas virtuais criadas no vApp"
  # O 'vcd_vapp_vm.vm' refere-se ao nome do recurso dentro do seu vapp.tf
  value       = vcd_vapp_vm.vm[*].network.ip 
}