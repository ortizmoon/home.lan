resource "proxmox_virtual_environment_vm" "gitlab" {
  name      = "gitlab.home.lan"
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
    dedicated = 4096
  }

  disk {
    datastore_id      = var.pm_datastore_id
    interface         = "scsi0"
    size              = 40
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  operating_system {
    type = "l26"
  }

  initialization {
    ip_config {
      ipv4 {
        address = "192.168.10.100/24"
        gateway = "192.168.10.1"
      }
    }
    user_account {
      username = "root"
      password = var.root_password
      keys     = [file(var.ssh_key_path)]
    }
  }

  serial_device {}
}