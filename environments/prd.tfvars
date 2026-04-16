vm_numbers     = 10

vapp_catalog     = "terraform"
template_name    = "Ubuntu Server 22.04 LTS"
vapp_network     = "LAN - 10.90.0.0/24 - PRD - APP"
vapp_name        = "git-devops"
storage_profile = "EHC-DM-T2"


server_names = [
"HML-HS-AWX",
"HML-HS-OZZY", "HML-HS-TEST01", "HML-HS-TEST02", "HML-HS-WEBAPP", "HML-HS-DBSRV", 
  "HML-HS-PROXY01", "HML-HS-MONITOR", "HML-HS-BACKUP", "HML-HS-API01", 
  "HML-HS-WORKER", "HML-HS-LAB01"
]