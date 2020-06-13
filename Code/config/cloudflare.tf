variable "cloudflare_email" {
  description = "Email address associated with my Cloudflare account"
}

variable "cloudflare_api_key" {
  description = "API key for Cloudflare"
}

provider "cloudflare" {
  version = "~> 2.0"
  email = var.cloudflare_email
  api_key = var.cloudflare_api_key
}

data "cloudflare_zones" "witteman_me" {
  filter {
    name = "witteman.me"
    status = "active"
  }
}

resource "cloudflare_record" "root_cname" {
  zone_id = data.cloudflare_zones.witteman_me.zones[0].id
  name = "witteman.me"
  value = "george.witteman.me"
  type = "CNAME"
  proxied = true
}

resource "cloudflare_record" "www_cname" {
  zone_id = data.cloudflare_zones.witteman_me.zones[0].id
  name = "www"
  value = "george.witteman.me"
  type = "CNAME"
  proxied = true
}

resource "cloudflare_record" "george_a_1" {
  zone_id = data.cloudflare_zones.witteman_me.zones[0].id
  name = "george"
  value = "185.199.111.153"
  type = "A"
  proxied = true
}

resource "cloudflare_record" "george_a_2" {
  zone_id = data.cloudflare_zones.witteman_me.zones[0].id
  name = "george"
  value = "185.199.110.153"
  type = "A"
  proxied = true
}

resource "cloudflare_record" "george_a_3" {
  zone_id = data.cloudflare_zones.witteman_me.zones[0].id
  name = "george"
  value = "185.199.109.153"
  type = "A"
  proxied = true
}

resource "cloudflare_record" "george_a_4" {
  zone_id = data.cloudflare_zones.witteman_me.zones[0].id
  name = "george"
  value = "185.199.108.153"
  type = "A"
  proxied = true
}

resource "cloudflare_record" "root_mx_10" {
  zone_id = data.cloudflare_zones.witteman_me.zones[0].id
  name = "witteman.me"
  value = "mail.protonmail.ch"
  type = "MX"
  priority = 10
}

resource "cloudflare_record" "root_mx_20" {
  zone_id = data.cloudflare_zones.witteman_me.zones[0].id
  name = "witteman.me"
  value = "mailsec.protonmail.ch"
  type = "MX"
  priority = 20
}

resource "cloudflare_record" "_dmarc_txt" {
  zone_id = data.cloudflare_zones.witteman_me.zones[0].id
  name = "_dmarc"
  value = "v=DMARC1; p=none; rua=mailto:george@witteman.me"
  type = "TXT"
}

resource "cloudflare_record" "protonmail__domain_key_txt" {
  zone_id = data.cloudflare_zones.witteman_me.zones[0].id
  name = "protonmail._domainkey"
  value = "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCxjwiT3lkRtIBknCvQ1El/LxThXV+jDeCTSsPZV/nA+5EB/AihaGPv9L/nwPwjRJdlkj7tsqoN25d1oPwE97tGN4YqjCgYkoY5FOK6n9JE8O3VdbNZAxjO1G5MDhXea8eb/JAWvkcf6yhB4ltWBllMaiUPhMwA3gIS20IiB+u4kQIDAQAB"
  type = "TXT"
}

resource "cloudflare_record" "root_spf1_txt" {
  zone_id = data.cloudflare_zones.witteman_me.zones[0].id
  name = "witteman.me"
  value = "v=spf1 include:_spf.protonmail.ch mx ~all"
  type = "TXT"
}

resource "cloudflare_record" "root_protonmail_verification_txt" {
  zone_id = data.cloudflare_zones.witteman_me.zones[0].id
  name = "witteman.me"
  value = "protonmail-verification=1315a155a7f84ab70d9c67dec5ff202cd8cb0a95"
  type = "TXT"
}
