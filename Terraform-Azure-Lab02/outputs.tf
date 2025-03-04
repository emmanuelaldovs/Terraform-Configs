output "resource_group_name" {
  value = azurerm_resource_group.rg_t.name
}

output "public_ip_address" {
  value = azurerm_linux_virtual_machine.my_terraform_vm_t.public_ip_address
}

output "tls_private_key" {
  value     = tls_private_key.example_ssh_t.private_key_pem
  sensitive = true
}