variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
}
variable "vpc_cidr" {
  description = "Range of vpc IP CIDR"
  type        = string
}

variable "vpc_name" {
  default = "example"
  description = "Name of vpc"
  type        = string
}

variable "ssh_key_path" {
  description = "Path to the SSH public key file"
  type        = string
}

variable "droplet_name" {
  description = "Name of the DigitalOcean Droplet"
  type        = string
}

variable "droplet_size" {
  type = string
  description = "The size of digitalocean droplet"
  default = "s-1vcpu-1gb"
}
