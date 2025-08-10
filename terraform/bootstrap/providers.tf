terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.48.4"
    }
  }
}
provider "proxmox" {
  endpoint  = var.pm_endpoint
  api_token = var.pm_api_token
  insecure  = true
  ssh {
    agent = true
  }
}