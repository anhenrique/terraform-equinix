terraform {
  backend "http" {
    address        = "https://gitlab-hs.hsprevent.com.br/api/v4/projects/387/terraform/state/hml"
    lock_address   = "https://gitlab-hs.hsprevent.com.br/api/v4/projects/387/terraform/state/hml/lock"
    unlock_address = "https://gitlab-hs.hsprevent.com.br/api/v4/projects/387/terraform/state/hml/lock"
    lock_method    = "POST"
    unlock_method  = "DELETE"
    retry_wait_min = 5
  }
}




