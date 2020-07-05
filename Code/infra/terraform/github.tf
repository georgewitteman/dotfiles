variable "github_token" {
  description = "Github access token"
}

provider "github" {
  version    = "~> 2.9"
  token      = var.github_token
  individual = true
}

resource "github_user_ssh_key" "personal_ssh" {
  title = "Personal"
  key   = file("./files/personal_public_ssh.key")
}

resource "github_user_ssh_key" "work_ssh" {
  title = "Work"
  key   = file("./files/work_public_ssh.key")
}

resource "github_user_gpg_key" "personal_gpg" {
  armored_public_key = file("./files/personal_public_gpg.key")
}

resource "github_user_gpg_key" "work_gpg" {
  armored_public_key = file("./files/work_public_gpg.key")
}
