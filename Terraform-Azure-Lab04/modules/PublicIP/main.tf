resource "azurerm_public_ip" "my_terraform_public_ip_t" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.allocation_method
}