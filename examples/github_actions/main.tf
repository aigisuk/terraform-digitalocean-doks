terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "AIGISUK"

    workspaces {
      name = "gh-actions-terraform-digitalocean-doks"
    }
  }
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
  required_version = ">= 1.0"
}

provider "digitalocean" {
  token = var.do_token
}

module "doks" {
  source = "git::https://github.com/aigisuk/terraform-digitalocean-doks.git?ref=develop"
}