variable "dnsimple_token" {
  description = "The DNSimple API v2 token"
}

variable "dnsimple_account" {
  description = "The ID of the account associated with the token"
}

provider "dnsimple" {
  version = "~> 0.4"
  token   = var.dnsimple_token
  account = var.dnsimple_account
}

module "dnsimple_fastmail_georgewitteman_com" {
  source = "./modules/dnsimple-fastmail"
  domain = "georgewitteman.com"
  dmarc  = "v=DMARC1; p=none; pct=100; rua=mailto:re+uimzzzgugvk@dmarc.postmarkapp.com; sp=none; aspf=r;"
}

module "dnsimple_fastmail_witteman_me" {
  source = "./modules/dnsimple-fastmail"
  domain = "witteman.me"
  dmarc  = "v=DMARC1; p=none; pct=100; rua=mailto:re+igrne0h0z9h@dmarc.postmarkapp.com; sp=none; aspf=r;"
}
