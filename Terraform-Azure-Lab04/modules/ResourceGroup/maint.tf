resource "random_pet" "rg_name_t" {
  prefix = var.name_prefix
}

resource "azurerm_resource_group" "rg_t" {
  location = var.location
  name     = random_pet.rg_name_t.id
}
