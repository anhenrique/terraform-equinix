terraform {
  required_providers {
    vcd = {
      source  = "vmware/vcd"
      version = ">= 3.14.0"
    }
  }
}

provider "vcd" {
  auth_type            = "api_token"
  user                 = "none"
  password             = "none"
  api_token            = var.vcd_api_token
  org                  = var.vcd_org
  vdc                  = var.vcd_vdc
  url                  = var.vcd_url
  allow_unverified_ssl = var.allow_unverified_ssl
}
