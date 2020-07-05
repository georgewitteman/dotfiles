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

resource "dnsimple_record" "CNAME_georgewitteman_com_1" {
  domain = "georgewitteman.com"
  name   = ""
  type   = "ALIAS"
  value  = "www.georgewitteman.com"
  ttl    = local.ttl
}

resource "dnsimple_record" "MX_georgewitteman_com_20" {
  domain   = "georgewitteman.com"
  name     = ""
  type     = "MX"
  priority = 20
  value    = "mailsec.protonmail.ch"
  ttl      = local.ttl
}

resource "dnsimple_record" "MX_georgewitteman_com_10" {
  domain   = "georgewitteman.com"
  name     = ""
  type     = "MX"
  priority = 10
  value    = "mail.protonmail.ch"
  ttl      = local.ttl
}

resource "dnsimple_record" "TXT__dmarc_georgewitteman_com" {
  domain = "georgewitteman.com"
  name   = "_dmarc"
  type   = "TXT"
  value  = "v=DMARC1; p=none; rua=mailto:george@georgewitteman.com"
  ttl    = local.ttl
}

resource "dnsimple_record" "TXT_georgewitteman_com_protonmail_verification" {
  domain = "georgewitteman.com"
  name   = ""
  type   = "TXT"
  value  = "protonmail-verification=5e71df338f4a9d18056862e22ccb58bb304b8fe1"
  ttl    = local.ttl
}

resource "dnsimple_record" "TXT_georgewitteman_com_spf" {
  domain = "georgewitteman.com"
  name   = ""
  type   = "TXT"
  value  = "v=spf1 include:_spf.protonmail.ch mx ~all"
  ttl    = local.ttl
}

resource "dnsimple_record" "TXT_protonmail__domainkey_georgewitteman_com_dkim1" {
  domain = "georgewitteman.com"
  name   = "protonmail._domainkey"
  type   = "TXT"
  value  = "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCt6oZy1fiDThNzUiHCZZtdV5uMJ1RvRhLDmAACHpnHW1FdDuVBjzspxrpDxOypY6zR+w2tKmNnS22mWcu+3JvmxkIO7fCL6OawiipX6S+na6GuVollRqIq++eVqvcLmUMXDVqF48diUNxcj+dTH4bOVqsiT4fFhwwOj8/a00sfTQIDAQAB"
  ttl    = local.ttl
}

resource "dnsimple_record" "MX_witteman_me_20" {
  domain   = "witteman.me"
  name     = ""
  type     = "MX"
  priority = 20
  value    = "mailsec.protonmail.ch"
  ttl      = local.ttl
}

resource "dnsimple_record" "MX_witteman_me_10" {
  domain   = "witteman.me"
  name     = ""
  type     = "MX"
  priority = 10
  value    = "mail.protonmail.ch"
  ttl      = local.ttl
}

resource "dnsimple_record" "TXT__dmarc_witteman_me" {
  domain = "witteman.me"
  name   = "_dmarc"
  type   = "TXT"
  value  = "v=DMARC1; p=none; rua=mailto:george@witteman.me"
  ttl    = local.ttl
}

resource "dnsimple_record" "TXT_witteman_me_protonmail_verification" {
  domain = "witteman.me"
  name   = ""
  type   = "TXT"
  value  = "protonmail-verification=1315a155a7f84ab70d9c67dec5ff202cd8cb0a95"
  ttl    = local.ttl
}

resource "dnsimple_record" "TXT_witteman_me_spf" {
  domain = "witteman.me"
  name   = ""
  type   = "TXT"
  value  = "v=spf1 include:_spf.protonmail.ch mx ~all"
  ttl    = local.ttl
}

resource "dnsimple_record" "TXT_protonmail__domainkey_witteman_me_dkim1" {
  domain = "witteman.me"
  name   = "protonmail._domainkey"
  type   = "TXT"
  value  = "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCxjwiT3lkRtIBknCvQ1El/LxThXV+jDeCTSsPZV/nA+5EB/AihaGPv9L/nwPwjRJdlkj7tsqoN25d1oPwE97tGN4YqjCgYkoY5FOK6n9JE8O3VdbNZAxjO1G5MDhXea8eb/JAWvkcf6yhB4ltWBllMaiUPhMwA3gIS20IiB+u4kQIDAQAB"
  ttl    = local.ttl
}
