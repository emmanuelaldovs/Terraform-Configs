output "Subnet_name_out" {
    value = azurerm_subnet.my_terraform_subnet_t.name
}

output "Subnet_AddressSpace_out" {
    value = azurerm_subnet.my_terraform_subnet_t.address_prefixes
}

output "Subnet_id_out" {
    value = azurerm_subnet.my_terraform_subnet_t.id
}