/*
variable "name" {}
variable "location" {}
variable "resource_group_name" {}
variable "security_rule_name" {}
variable "priority" {}
variable "direction" {}
variable "access" {}
variable "protocol" {} 
variable "source_port_range" {}
variable "destination_port_range" {}
variable "source_address_prefix" {}
variable "destination_address_prefix" {}
*/
variable "name" {}
variable "location" {}
variable "resource_group_name" {}

variable "security_rules" {
  type = list(object({
    name                        = string
    priority                    = number
    direction                   = string
    access                      = string
    protocol                    = string
    source_port_range           = string
    destination_port_range      = string
    source_address_prefix       = string
    destination_address_prefix  = string
  }))
}
