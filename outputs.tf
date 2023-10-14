output "ip_private" {
    value = digitalocean_droplet.my_droplet.ipv4_address_private
}
output "ip_public" {
    sensitive = true
    value = digitalocean_droplet.my_droplet.ipv4_address
}