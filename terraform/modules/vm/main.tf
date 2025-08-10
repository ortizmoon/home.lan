resource "proxmox_virtual_environment_vm" "this" {
  name      = var.name
  node_name = var.node_name

  clone {
    vm_id = var.pm_template_id
  }

  agent {
    enabled = true
  }

  cpu {
    cores   = var.cpu
    sockets = 1
    type    = "host"
  }

  memory {
    dedicated = var.mem
  }

  # root/system disk
  disk {
    datastore_id = var.pm_datastore_id
    interface    = "scsi0"
    size         = var.disk
  }

  # extra data disks
  dynamic "disk" {
    for_each = var.extra_disks
    content {
      datastore_id = try(disk.value.datastore_id, var.pm_datastore_id)
      interface    = try(disk.value.interface, "scsi1")
      size         = disk.value.size
      file_format  = try(disk.value.file_format, null)
      discard      = try(disk.value.discard, null)
      ssd          = try(disk.value.ssd, null)
      iothread     = try(disk.value.iothread, null)
    }
  }

  # one or more NICs
  dynamic "network_device" {
    for_each = length(var.nics) > 0 ? var.nics : [ { bridge = var.default_bridge } ]
    content {
      bridge = try(network_device.value.bridge, var.default_bridge)
      model  = try(network_device.value.model, "virtio")
    }
  }

  operating_system {
    type = "l26"
  }

  initialization {
    dns {
      domain  = ""
      servers = length(try(var.net.dns_servers, [])) > 0 ? var.net.dns_servers : [var.dns_ip]
    }
    ip_config {
      ipv4 {
        address = "${var.ip}/${try(var.net.cidr, 24)}"
        gateway = try(var.net.gateway, var.gateway_ip)
      }
    }
    user_account {
      username = "root"
      keys     = [file(var.ssh_key)]
    }
  }

  serial_device {}
}