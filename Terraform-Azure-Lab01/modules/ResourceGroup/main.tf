resource "azurerm_resource_group" "rg_t" {
  name = "${var.base_name}RG"
  location = var.location
}
