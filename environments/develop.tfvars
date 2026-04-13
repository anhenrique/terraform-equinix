vm_numbers     = 10

vapp_catalog     = "terraform"
template_name    = "Ubuntu Server 22.04 LTS"
vapp_network     = "LAN - 10.90.0.0/24 - PRD - APP"
vapp_name        = "git-devops"
default_password = "!#c!0ud#!"
storage_profile = "EHC-DM-T2"


server_names = [
"HML-HS-AWX",
"HML-HS-OZZY", "HML-HS-TEST-01", "HML-HS-TEST-02", "HML-HS-WEB-APP", "HML-HS-DB-SRV", 
  "HML-HS-PROXY-01", "HML-HS-MONITOR", "HML-HS-BACKUP", "HML-HS-API-01", 
  "HML-HS-WORKER", "HML-HS-LAB-01"
]