resource "local_file" "ansible_inventory" {
  content  = templatefile("${path.module}/inventory.yml.tmpl", {
<<<<<<< HEAD
    # consul_ip  = split("/", proxmox_virtual_environment_vm.consul.ipv4_addresses[1][0])[0]
    # traefik_ip = split("/", proxmox_virtual_environment_vm.traefik.ipv4_addresses[1][0])[0]
    # netbox_ip  = split("/", proxmox_virtual_environment_vm.netbox.ipv4_addresses[1][0])[0]
    consul_ip       = var.consul_ip
    traefik_ip      = var.traefik_ip
    netbox_ip       = var.netbox_ip

    ssh_privatekey  = var.ssh_privatekey
=======
    consul_ip  = var.consul_ip
    traefik_ip = var.traefik_ip
    netbox_ip  = var.netbox_ip
    ssh_privatekey = var.ssh_privatekey
>>>>>>> 6d361f6 (Add ip-vars in terraform)

    consul_domain   = var.consul_domain
    traefik_domain  = var.traefik_domain
    netbox_domain   = var.netbox_domain
  })

  filename = "${path.module}/../../ansible/inventories/inventory.yml"
}