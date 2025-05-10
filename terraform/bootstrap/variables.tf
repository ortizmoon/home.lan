variable "pm_user" {
    type    = string
}
variable "pm_password" {
    type    = string
}
variable "pm_endpoint" {
    type    = string
    description = "Proxmox API endpoint URL"
}
variable "pm_api_token" {
    type    = string
    description = "Proxmox API token"
}
variable "pm_template_id" {
    type    = string
    description = "ID of the template to clone from"
}
variable "pm_datastore_id" {
    type    = string
    description = "ID of the datastore to use"
}
variable "ssh_key_path" {
  type    = string  
}