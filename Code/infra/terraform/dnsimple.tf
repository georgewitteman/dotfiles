variable "dnsimple_token" {
  description = "The DNSimple API v2 token"
}

variable "dnsimple_account" {
  description = "The ID of the account associated with the token"
}

locals {
  ttl = 60 * 15
}

provider "dnsimple" {
  version = "~> 0.4"
  token   = var.dnsimple_token
  account = var.dnsimple_account
}

module "dnsimple_fastmail_georgewitteman_com" {
  source = "./modules/dnsimple-fastmail"
  domain = "georgewitteman.com"
}

module "dnsimple_fastmail_witteman_me" {
  source = "./modules/dnsimple-fastmail"
  domain = "witteman.me"
}
