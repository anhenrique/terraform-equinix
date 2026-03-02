terraform {
  backend "http" {
    address        = "https://gitlab.com/api/v4/projects/387/terraform/state/terraform-state"
    lock_address   = "https://gitlab.com/api/v4/projects/387/terraform/state/terraform-state/lock"
    unlock_address = "https://gitlab.com/api/v4/projects/387/terraform/state/terraform-state/lock"
    lock_method    = "POST"
    unlock_method  = "DELETE"
    retry_wait_min = 5
  }
}


