module "infra_vapp" {
  source = "./infra-vapp"

  vcd_org       = var.vcd_org
  vcd_vdc       = var.vcd_vdc
  vapp_name     = var.vapp_name
  vapp_network  = var.vapp_network
  vapp_catalog  = var.vapp_catalog
  template_name = var.template_name
  server_names = var.server_names
  storage_profile = var.storage_profile

  #vm_name_prefix      = var.vm_name_prefix
  vm_numbers          = var.vm_numbers
  memory              = var.memory
  cpus                = var.cpus
  cpu_cores           = var.cpu_cores
  force_customization = var.force_customization
  default_password    = var.default_password

  providers = {
    vcd = vcd
  }
}
