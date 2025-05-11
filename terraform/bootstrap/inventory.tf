resource "local_file" "ansible_inventory" {
  content  = templatefile("${path.module}/inventory.yml.tmpl", {
    traefik_ip = proxmox_vm_qemu.traefik.default_ipv4_address
    netbox_ip  = proxmox_vm_qemu.netbox.default_ipv4_address
  })

  filename = "${path.module}/../../ansible/inventories/inventory.yml"
}