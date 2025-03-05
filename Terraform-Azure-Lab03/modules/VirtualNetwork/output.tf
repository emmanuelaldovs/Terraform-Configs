output "VirtualNetwork_name_out" {
    value = azurerm_virtual_network.my_terraform_network_t.name
}

output "VirtualNetwork_AddressSpace_out" {
    #value = resource.azurerm_virtual_network.my_terraform_network_t.address_space
    value = azurerm_virtual_network.my_terraform_network_t.address_space
}