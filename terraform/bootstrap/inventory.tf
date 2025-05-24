resource "local_file" "ansible_inventory" {
  content  = templatefile("${path.module}/inventory.yml.tmpl", {
    consul_ip  = var.consul_ip
    traefik_ip = var.traefik_ip
    netbox_ip  = var.netbox_ip
    
    ssh_privatekey = var.ssh_privatekey

    consul_domain   = var.consul_domain
    traefik_domain  = var.traefik_domain
    netbox_domain   = var.netbox_domain
  })

  filename = "${path.module}/../../ansible/inventories/inventory.yml"
}