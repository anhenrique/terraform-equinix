# Quantidade de VMS que deseja criar
vm_numbers     = 9

#Catalogo de maquinas, rede e senha defult, mude conforme necessidade

vapp_catalog     = "terraform"
template_name    = "Ubuntu Server 22.04 LTS"
vapp_network     = "LAN - 10.60.0.0/16 - HML - APP/DEV"
vapp_name        = "git-hml"
default_password = "!#c!0ud#!"
storage_profile = "EHC-DM-T2"

# Nome que deseja aplciar nos novos servidores

server_names = [
"HML-HS-TES_3",
"HML-HS-NOVO",
"HML-HS_teste3",
"HML-HS-NOVO2",
"aaaaaaaaaa",
"dsaokdsoa",
"top",
"devops",
"devops2"
]