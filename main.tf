resource "digitalocean_vpc" "my-vpc" {
   name = "${var.vpc_name}-${local.vpc_name_prefix}"
   region = "${local.region}"
   ip_range = var.vpc_cidr
}

resource "digitalocean_ssh_key" "my_ssh_key" {
  name       = local.ssh_key_name
  public_key = file(var.ssh_key_path)
}

resource "digitalocean_droplet" "my_droplet" {
  name   = var.droplet_name
  image  = local.droplet_image
  region = local.region
  size   = var.droplet_size
  ssh_keys = [digitalocean_ssh_key.my_ssh_key.fingerprint]

}

resource "digitalocean_firewall" "my_firewall" {
  name        = local.firewall_name
  droplet_ids = [digitalocean_droplet.my_droplet.id]

  inbound_rule {
    protocol           = "tcp"
    port_range         = "22"
    source_addresses  = ["0.0.0.0/0"]  # Allow SSH from all IP addresses
  }

  outbound_rule {
    protocol          = "tcp"
    port_range        = "1-65535"  # Allow all outbound ports
    destination_addresses = ["0.0.0.0/0"]  # Allow outbound traffic to all IP addresses
  }

}
