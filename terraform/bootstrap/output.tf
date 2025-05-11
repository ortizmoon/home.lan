output "traefik_ips" {
  value = proxmox_virtual_environment_vm.traefik.ipv4_addresses
}

output "netbox_ips" {
  value = proxmox_virtual_environment_vm.netbox.ipv4_addresses
}