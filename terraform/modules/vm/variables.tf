variable "name" {
  type = string
}

variable "node_name" {
  type    = string
  default = "pve"
}

variable "ip" {
  type = string
}

variable "cpu" {
  type = number
}

variable "mem" {
  type = number
}

variable "disk" {
  type = number
}

variable "nics" {
  description = "List of NIC maps, e.g. [{ bridge=\"vmbr0\", model=\"virtio\" }]"
  type        = list(any)
  default     = []
}

variable "extra_disks" {
  description = "List of extra disk maps with fields: datastore_id, interface, size, file_format, discard, ssd, iothread"
  type        = list(any)
  default     = []
}

variable "net" {
  description = "Optional network overrides map: { cidr, gateway, dns_servers }"
  type        = any
  default     = {}
}

variable "pm_template_id" {
  type = string
}

variable "pm_datastore_id" {
  type = string
}

variable "dns_ip" {
  type = string
}

variable "gateway_ip" {
  type = string
}

variable "ssh_key" {
  type = string
}

variable "default_bridge" {
  type    = string
  default = "vmbr0"
}





