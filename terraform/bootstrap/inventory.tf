resource "local_file" "ansible_inventory" {
  content  = templatefile("${path.module}/inventory.yml.tmpl", {
    traefik_ip = split("/", proxmox_virtual_environment_vm.traefik.ipv4_addresses[1][0])[0]
    netbox_ip  = split("/", proxmox_virtual_environment_vm.netbox.ipv4_addresses[1][0])[0]
    ssh_privatekey = var.ssh_privatekey
  })

  filename = "${path.module}/../../ansible/inventories/inventory.yml"
}