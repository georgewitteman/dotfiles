locals {
  dkim_hosts = ["fm1", "fm2", "fm3"]
  mx_hosts   = ["", "*", "mail"]
}

resource "dnsimple_record" "mail" {
  domain = var.domain
  name   = "mail"
  type   = "ALIAS"
  ttl    = var.ttl

  value = "mail.fastmail.com"
}

resource "dnsimple_record" "mx_10" {
  count = length(local.mx_hosts)

  domain   = var.domain
  name     = element(local.mx_hosts, count.index)
  type     = "MX"
  ttl      = var.ttl
  priority = "20"

  value = "in1-smtp.messagingengine.com"
}

resource "dnsimple_record" "mx_20" {
  count = length(local.mx_hosts)

  domain   = var.domain
  name     = element(local.mx_hosts, count.index)
  type     = "MX"
  ttl      = var.ttl
  priority = "20"

  value = "in2-smtp.messagingengine.com"
}

resource "dnsimple_record" "spf" {
  domain = var.domain
  name   = ""
  type   = "TXT"
  ttl    = var.ttl

  value = "v=spf1 include:spf.messagingengine.com ?all"
}

resource "dnsimple_record" "dkim" {
  count = length(local.dkim_hosts)

  domain = var.domain
  name   = "${element(local.dkim_hosts, count.index)}._domainkey"
  type   = "CNAME"
  ttl    = var.ttl

  value = "${element(local.dkim_hosts, count.index)}.${var.domain}.dkim.fmhosted.com"
}

resource "dnsimple_record" "dmarc" {
  domain = var.domain
  name   = "_dmarc"
  type   = "TXT"
  ttl    = var.ttl

  value = var.dmarc
}

resource "dnsimple_record" "srv_submission" {
  domain = var.domain
  name   = "_submission._tcp"
  type   = "SRV"
  ttl    = var.ttl

  value = "1 587 smtp.fastmail.com"
}

resource "dnsimple_record" "srv_imap" {
  domain = var.domain
  name   = "_imap._tcp"
  type   = "SRV"
  ttl    = var.ttl

  value = "0 0"
}

resource "dnsimple_record" "srv_imaps" {
  domain = var.domain
  name   = "_imaps._tcp"
  type   = "SRV"
  ttl    = var.ttl

  value = "1 993 imap.fastmail.com"
}

resource "dnsimple_record" "srv_pop3" {
  domain = var.domain
  name   = "_pop3._tcp"
  type   = "SRV"
  ttl    = var.ttl

  value = "0 0"
}

resource "dnsimple_record" "srv_pop3s" {
  domain = var.domain
  name   = "_pop3s._tcp"
  type   = "SRV"
  ttl    = var.ttl

  value = "1 995 pop.fastmail.com"
}

resource "dnsimple_record" "srv_jmap" {
  domain = var.domain
  name   = "_jmap._tcp"
  type   = "SRV"
  ttl    = var.ttl

  value = "1 443 jmap.fastmail.com"
}

resource "dnsimple_record" "srv_carddav" {
  domain = var.domain
  name   = "_carddav._tcp"
  type   = "SRV"
  ttl    = var.ttl

  value = "0 0"
}

resource "dnsimple_record" "srv_carddavs" {
  domain = var.domain
  name   = "_carddavs._tcp"
  type   = "SRV"
  ttl    = var.ttl

  value = "1 443 carddav.fastmail.com"
}

resource "dnsimple_record" "srv_caldav" {
  domain = var.domain
  name   = "_caldav._tcp"
  type   = "SRV"
  ttl    = var.ttl

  value = "0 0"
}

resource "dnsimple_record" "srv_caldavs" {
  domain = var.domain
  name   = "_caldavs._tcp"
  type   = "SRV"
  ttl    = var.ttl

  value = "1 443 caldav.fastmail.com"
}
