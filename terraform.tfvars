# Configurações do ambiente
vcd_url              = "https://ehcportal-sp.equinix.com.br/api"
vcd_org              = "HSPREVENTLTDA627268"
vcd_vdc              = "HSPREVENTL-0975-DM-VDC"
allow_unverified_ssl = true

# Infraestrutura
vapp_catalog     = "terraform"
template_name    = "Ubuntu Server 22.04 LTS"
vapp_network     = "LAN - 172.40.0.0/16 - PRD - HSPREVENT"
vapp_name        = "git-lab-devops"
default_password = "!#c!0ud#!"

# Para que isso seja perguntado:
# vm_numbers     = 2
# vm_name_prefix = "meu-prefixo"
