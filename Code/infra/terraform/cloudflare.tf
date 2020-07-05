variable "cloudflare_email" {
  description = "Email address associated with my Cloudflare account"
}

variable "cloudflare_api_key" {
  description = "API key for Cloudflare"
}

provider "cloudflare" {
  version = "~> 2.0"
  email   = var.cloudflare_email
  api_key = var.cloudflare_api_key
}

data "cloudflare_zones" "witteman_me" {
  filter {
    name   = "witteman.me"
    status = "active"
  }
}

data "cloudflare_zones" "georgewitteman_com" {
  filter {
    name   = "georgewitteman.com"
    status = "active"
  }
}

resource "cloudflare_record" "A_www_georgewitteman_com_a2a849c330ac8d5fcc732da81fbc9c4c" {
  zone_id = data.cloudflare_zones.georgewitteman_com.zones[0].id
  name    = "www"
  type    = "A"
  proxied = "true"
  value   = "185.199.110.153"
}

resource "cloudflare_record" "A_www_georgewitteman_com_7d89751b5a40b20f9d3ae363c9c15871" {
  zone_id = data.cloudflare_zones.georgewitteman_com.zones[0].id
  name    = "www"
  type    = "A"
  proxied = "true"
  value   = "185.199.111.153"
}

resource "cloudflare_record" "A_www_georgewitteman_com_4acdde0e8156f62a831e2137df540adf" {
  zone_id = data.cloudflare_zones.georgewitteman_com.zones[0].id
  name    = "www"
  type    = "A"
  proxied = "true"
  value   = "185.199.108.153"
}

resource "cloudflare_record" "A_www_georgewitteman_com_f616fbde191b58777dc4415bf00b60b7" {
  zone_id = data.cloudflare_zones.georgewitteman_com.zones[0].id
  name    = "www"
  type    = "A"
  proxied = "true"
  value   = "185.199.109.153"
}

resource "cloudflare_record" "CNAME_georgewitteman_com_66ee7b2dc9bcbecf7a155239decb0a83" {
  zone_id = data.cloudflare_zones.georgewitteman_com.zones[0].id
  name    = "georgewitteman.com"
  type    = "CNAME"
  proxied = "true"
  value   = "www.georgewitteman.com"
}

resource "cloudflare_record" "MX_georgewitteman_com_4c5517a66f25c22e4c8eb0b94fc985a8" {
  zone_id  = data.cloudflare_zones.georgewitteman_com.zones[0].id
  name     = "georgewitteman.com"
  type     = "MX"
  proxied  = "false"
  priority = "20"
  value    = "in2-smtp.messagingengine.com"
}

resource "cloudflare_record" "MX_georgewitteman_com_15e8f7c49a9025cbf0a57606d4507d6b" {
  zone_id  = data.cloudflare_zones.georgewitteman_com.zones[0].id
  name     = "georgewitteman.com"
  type     = "MX"
  proxied  = "false"
  priority = "10"
  value    = "in1-smtp.messagingengine.com"
}

resource "cloudflare_record" "TXT__dmarc_georgewitteman_com_eac2b4a4c229682cc35127a78b3c4241" {
  zone_id = data.cloudflare_zones.georgewitteman_com.zones[0].id
  name    = "_dmarc"
  type    = "TXT"
  proxied = "false"
  value   = "v=DMARC1; p=none; pct=100; rua=mailto:re+uimzzzgugvk@dmarc.postmarkapp.com; sp=none; aspf=r;"
}

resource "cloudflare_record" "TXT_georgewitteman_com_a848df1bd8bca7deb713190894f0a28b" {
  zone_id = data.cloudflare_zones.georgewitteman_com.zones[0].id
  name    = "georgewitteman.com"
  type    = "TXT"
  proxied = "false"
  value   = "protonmail-verification=5e71df338f4a9d18056862e22ccb58bb304b8fe1"
}

resource "cloudflare_record" "TXT_georgewitteman_com_777224646f38ed4487dd4fed87a7cd01" {
  zone_id = data.cloudflare_zones.georgewitteman_com.zones[0].id
  name    = "georgewitteman.com"
  type    = "TXT"
  proxied = "false"
  value   = "v=spf1 include:spf.messagingengine.com ?all"
}

resource "cloudflare_record" "TXT_protonmail__domainkey_georgewitteman_com_500fcfb5228c795890583aca0bf6f2cf" {
  zone_id = data.cloudflare_zones.georgewitteman_com.zones[0].id
  name    = "protonmail._domainkey"
  type    = "TXT"
  proxied = "false"
  value   = "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCt6oZy1fiDThNzUiHCZZtdV5uMJ1RvRhLDmAACHpnHW1FdDuVBjzspxrpDxOypY6zR+w2tKmNnS22mWcu+3JvmxkIO7fCL6OawiipX6S+na6GuVollRqIq++eVqvcLmUMXDVqF48diUNxcj+dTH4bOVqsiT4fFhwwOj8/a00sfTQIDAQAB"
}

resource "cloudflare_record" "A_george_witteman_me_426763cece324dce7d10a17a38782ea0" {
  zone_id = data.cloudflare_zones.witteman_me.zones[0].id
  name    = "george"
  type    = "A"
  proxied = "true"
  value   = "185.199.109.153"
}

resource "cloudflare_record" "A_george_witteman_me_f02e0ab5ab79f7f43aef792362d546a4" {
  zone_id = data.cloudflare_zones.witteman_me.zones[0].id
  name    = "george"
  type    = "A"
  proxied = "true"
  value   = "185.199.111.153"
}

resource "cloudflare_record" "A_george_witteman_me_34264b4c33b586e2f138164fc034642c" {
  zone_id = data.cloudflare_zones.witteman_me.zones[0].id
  name    = "george"
  type    = "A"
  proxied = "true"
  value   = "185.199.108.153"
}

resource "cloudflare_record" "A_george_witteman_me_c1c4101f301f96ffcd6d1e58ad199d80" {
  zone_id = data.cloudflare_zones.witteman_me.zones[0].id
  name    = "george"
  type    = "A"
  proxied = "true"
  value   = "185.199.110.153"
}

resource "cloudflare_record" "CNAME_witteman_me_673fd6647a90f4e44096ca7daec866a7" {
  zone_id = data.cloudflare_zones.witteman_me.zones[0].id
  name    = "witteman.me"
  type    = "CNAME"
  proxied = "true"
  value   = "george.witteman.me"
}

resource "cloudflare_record" "CNAME_www_witteman_me_7fd44682d13ba5f0ebced2d6735babbd" {
  zone_id = data.cloudflare_zones.witteman_me.zones[0].id
  name    = "www"
  type    = "CNAME"
  proxied = "true"
  value   = "george.witteman.me"
}

resource "cloudflare_record" "MX_witteman_me_0dccef06819f99d196bef01e62b5c787" {
  zone_id  = data.cloudflare_zones.witteman_me.zones[0].id
  name     = "witteman.me"
  type     = "MX"
  proxied  = "false"
  priority = "20"
  value    = "in2-smtp.messagingengine.com"
}

resource "cloudflare_record" "MX_witteman_me_9a1ffec5c2d0b490c89f013ee99f2c9e" {
  zone_id  = data.cloudflare_zones.witteman_me.zones[0].id
  name     = "witteman.me"
  type     = "MX"
  proxied  = "false"
  priority = "10"
  value    = "in1-smtp.messagingengine.com"
}

resource "cloudflare_record" "TXT__dmarc_witteman_me_ee36eb923adacdcd3cbcf35a8d3a2ba3" {
  zone_id = data.cloudflare_zones.witteman_me.zones[0].id
  name    = "_dmarc"
  type    = "TXT"
  proxied = "false"
  value   = "v=DMARC1; p=none; pct=100; rua=mailto:re+igrne0h0z9h@dmarc.postmarkapp.com; sp=none; aspf=r;"
}

resource "cloudflare_record" "TXT_fastmail_fm1_domainkey_witteman_me" {
  zone_id = data.cloudflare_zones.witteman_me.zones[0].id
  name    = "fm1._domainkey"
  type    = "CNAME"
  proxied = "false"
  value   = "fm1.witteman.me.dkim.fmhosted.com"
}

resource "cloudflare_record" "TXT_fastmail_fm2_domainkey_witteman_me" {
  zone_id = data.cloudflare_zones.witteman_me.zones[0].id
  name    = "fm2._domainkey"
  type    = "CNAME"
  proxied = "false"
  value   = "fm2.witteman.me.dkim.fmhosted.com"
}

resource "cloudflare_record" "TXT_fastmail_fm3_domainkey_witteman_me" {
  zone_id = data.cloudflare_zones.witteman_me.zones[0].id
  name    = "fm3._domainkey"
  type    = "CNAME"
  proxied = "false"
  value   = "fm3.witteman.me.dkim.fmhosted.com"
}

resource "cloudflare_record" "TXT_protonmail__domainkey_witteman_me_26127818bfa60edffb2382e49d0eba76" {
  zone_id = data.cloudflare_zones.witteman_me.zones[0].id
  name    = "protonmail._domainkey"
  type    = "TXT"
  proxied = "false"
  value   = "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCxjwiT3lkRtIBknCvQ1El/LxThXV+jDeCTSsPZV/nA+5EB/AihaGPv9L/nwPwjRJdlkj7tsqoN25d1oPwE97tGN4YqjCgYkoY5FOK6n9JE8O3VdbNZAxjO1G5MDhXea8eb/JAWvkcf6yhB4ltWBllMaiUPhMwA3gIS20IiB+u4kQIDAQAB"
}

resource "cloudflare_record" "TXT_witteman_me_e25301a2660a5a7230be00bc89c9caf0" {
  zone_id = data.cloudflare_zones.witteman_me.zones[0].id
  name    = "witteman.me"
  type    = "TXT"
  proxied = "false"
  value   = "protonmail-verification=1315a155a7f84ab70d9c67dec5ff202cd8cb0a95"
}

resource "cloudflare_record" "TXT_witteman_me_08b1c08e304e258a38018a6af7d22f79" {
  zone_id = data.cloudflare_zones.witteman_me.zones[0].id
  name    = "witteman.me"
  type    = "TXT"
  proxied = "false"
  value   = "v=spf1 include:spf.messagingengine.com ?all"
}
