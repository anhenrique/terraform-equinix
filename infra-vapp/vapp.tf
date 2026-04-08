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
  
  computer_name = "srv-${var.server_names[count.index]}"

  memory    = var.memory
  cpus      = var.cpus
  cpu_cores = var.cpu_cores
  power_on  = true
  vdc       = var.vcd_vdc

  network {
    type               = "org"
    name               = var.vapp_network
    ip_allocation_mode = "POOL"
    is_primary         = true
  }

  customization {
    force                      = var.force_customization
    enabled                    = true # Mantemos true para que o script rode no primeiro boot [1]
    allow_local_admin_password = true
    auto_generate_password     = false
    admin_password             = var.default_password
    # Carrega o script shell externo
    initscript                 = file("${path.module}/scripts/setup.sh")
  }

  # O guest_properties DEVE estar dentro do recurso da VM
  guest_properties = {
    "user-data" = base64encode(templatefile("${path.module}/cloudinit.yaml", {
      user_password = var.default_password
    }))
  }

}

resource "vcd_vapp_org_network" "networks" {
  vapp_name        = vcd_vapp.my_vapp.name
  org_network_name = var.vapp_network

  # Esta configuração impede que o Terraform destrua o recurso
  lifecycle {
    prevent_destroy = true
  }
}