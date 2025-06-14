resource "azurerm_network_interface" "my_terraform_nic_t" {
  name                = "myNIC"
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic ip_configuration {
    for_each = var.ip_configurations
    content {
        name                            = ip_configuration.value.name
        subnet_id                       = ip_configuration.value.subnet_id
        private_ip_address_allocation   = ip_configuration.value.private_ip_address_allocation
        public_ip_address_id            = ip_configuration.value.public_ip_address_id
        }
    }
}