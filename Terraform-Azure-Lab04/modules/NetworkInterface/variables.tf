variable "name" {}
variable "location" {}
variable "resource_group_name" {}

variable "ip_configurations" {
  type = list(object({
    name                            = string
    subnet_id                       = string
    private_ip_address_allocation   = string
    public_ip_address_id            = string    
  }))
}