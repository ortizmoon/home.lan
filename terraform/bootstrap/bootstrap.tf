locals {
  bootstrap_vms = {
    vault = {
      name = var.vault_domain
      ip   = var.vault_ip
      cpu  = 2
      mem  = 1024
      disk = 35
    }
    traefik = {
      name = var.traefik_domain
      ip   = var.traefik_ip
      cpu  = 2
      mem  = 2048
      disk = 35
    }
    consul = {
      name = var.consul_domain
      ip   = var.consul_ip
      cpu  = 1
      mem  = 1024
      disk = 35
    }
  }
}

module "vm" {
  source   = "../modules/vm"
  for_each = local.bootstrap_vms

  name      = each.value.name
  node_name = "pve"

  ip   = each.value.ip
  cpu  = each.value.cpu
  mem  = each.value.mem
  disk = each.value.disk

  nics        = try(each.value.nics, [])
  extra_disks = try(each.value.extra_disks, [])
  net         = try(each.value.net, {})

  pm_template_id  = var.pm_template_id
  pm_datastore_id = var.pm_datastore_id

  dns_ip     = var.dns_ip
  gateway_ip = var.gateway_ip
  ssh_key    = var.ssh_key

  default_bridge = var.default_bridge
}