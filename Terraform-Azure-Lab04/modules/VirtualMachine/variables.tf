variable "vm_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "os_disk_name" {
  type = string
}

variable "os_disk_type" {
  type = string
}

variable "os_disk_caching" {
  type = string
}

variable "image_publisher" {
  type = string
}

variable "image_offer" {
  type = string
}

variable "image_sku" {
  type = string
}

variable "image_version" {
  type = string
}

variable "computer_name" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "public_key" {
  type = string
}

variable "storage_account_uri" {
  type = string
}

variable "disable_password_authentication" {
  type = bool
}

variable "network_interface_ids" {
  type = list(string)
}