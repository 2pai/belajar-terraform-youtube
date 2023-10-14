terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }

  cloud {
    organization = "iqbal-syamil-lab"

    workspaces {
      name = "demo-youtube-iqbal"
    }
  }

}

provider "digitalocean" {
  token = var.do_token
}