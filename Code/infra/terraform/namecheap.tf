variable "namecheap_username" {
  description = "A registered username for namecheap"
}

variable "namecheap_api_user" {
  description = "A registered apiuser for namecheap"
}

variable "namecheap_token" {
  description = "The token key for API operations"
}

variable "namecheap_ip" {
  description = "IP addess of the machine running terraform"
}

provider "namecheap" {
  version     = "~> 1.5"
  username    = var.namecheap_username
  api_user    = var.namecheap_api_user
  token       = var.namecheap_token
  ip          = var.namecheap_ip
  use_sandbox = false
}
