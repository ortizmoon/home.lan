resource "proxmox_virtual_environment_vm" "netbox" {
  name      = "cmdb.ebatra.com"
  node_name = "pve"

  clone {
    vm_id = var.pm_template_id
  }

  agent {
    enabled = true
  }

  cpu {
    cores   = 2
    sockets = 1
    type    = "host"
  }

  memory {
    dedicated = 1024
  }

  disk {
    datastore_id = var.pm_datastore_id
    interface    = "scsi0"
    size         = 35
  }
  
## Uncomment for add second disk
  # disk {
  #   datastore_id = var.pm_datastore2_id
  #   interface    = "scsi1"
  #   size         = 100
  #   file_format  = "qcow2"
  #   discard      = "on"
  #   ssd          = true
  #   iothread     = true
  # }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  operating_system {
    type = "l26"
  }

  initialization {
    dns {
      domain = ""
      servers = ["192.168.10.1"]
    }  
    ip_config {
      ipv4 {
        address = "192.168.10.3/24"
        gateway = "192.168.10.1"
      }
    }
    user_account {
      username = "root"
      password = "root123"
      keys     = [file(var.ssh_key_path)]
    }
  }

  serial_device {}
}