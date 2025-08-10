variable "consul_domain" {
  type    = string
}

variable "traefik_domain" {
  type    = string
}

variable "vault_domain" {
  type    = string
}

variable "vault_ip" {
  type    = string
}

variable "consul_ip" {
  type    = string
}

variable "traefik_ip" {
  type    = string
}

variable "gateway_ip" {
  type    = string
}

variable "dns_ip" {
  type    = string
}


variable "default_bridge" {
  type        = string
  default     = "vmbr0"
}