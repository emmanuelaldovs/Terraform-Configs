output "PublicIp_name_out" {
    value = azurerm_public_ip.my_terraform_public_ip_t.name
}

output "PublicIp_address_ip_out" {
    value = azurerm_public_ip.my_terraform_public_ip_t.ip_address
}

output "PublicIp_address_ip_id_out" {
    value = azurerm_public_ip.my_terraform_public_ip_t.id
}