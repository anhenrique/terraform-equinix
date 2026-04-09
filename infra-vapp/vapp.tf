resource "vcd_vapp" "my_vapp" {
  name     = var.vapp_name
  power_on = true
}

data "vcd_catalog" "catalog" {
  org  = var.vcd_org
  name = var.vapp_catalog
}

data "vcd_catalog_vapp_template" "template" {
  org        = var.vcd_org
  catalog_id = data.vcd_catalog.catalog.id
  name       = var.template_name
}

resource "vcd_vapp_vm" "vms" {
  count = length(var.server_names)

  vapp_name        = vcd_vapp.my_vapp.name
  name             =  var.server_names[count.index]
  vapp_template_id = data.vcd_catalog_vapp_template.template.id

  memory    = var.memory
  cpus      = var.cpus
  cpu_cores = var.cpu_cores
  power_on  = true
  vdc       = var.vcd_vdc

 # Define a política de disco principal da VM
  storage_profile = var.storage_profile


  network {
    type               = "org"
    name               = var.vapp_network
    ip_allocation_mode = "POOL"
    is_primary         = true
  }

  customization {
    force                      = var.force_customization
    enabled                    = false # Desabilitamos a customização automática do vCD
    allow_local_admin_password = true
    auto_generate_password     = false
    admin_password = var.default_password
    # Se seu template suporta initscript (script shell)
    initscript = file("${path.module}/scripts/setup.sh")
  }

  guest_properties = {
    "user-data" = base64encode(templatefile("${path.module}/cloudinit.yaml", {
      user_password = var.default_password
    }))
  }
}

resource "vcd_vapp_org_network" "networks" {
  vapp_name        = vcd_vapp.my_vapp.name
  org_network_name = var.vapp_network

  reboot_vapp_on_removal = true 

  # Esta configuração impede que o Terraform destrua o recurso
  lifecycle {
    prevent_destroy = false
  }
}