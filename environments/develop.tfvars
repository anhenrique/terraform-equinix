vm_numbers     = 2

vapp_catalog     = "terraform"
template_name    = "Ubuntu Server 22.04 LTS"
vapp_network     = "LAN - 10.90.0.0/24 - PRD - APP"
vapp_name        = "git-devops"
storage_profile = "EHC-DM-T2"


server_names = [
"HML-HS-AWX",
"HML-HS-OZZY"
]