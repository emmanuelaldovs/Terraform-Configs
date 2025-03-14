output "virutalmachine_name_out" {
    value = azurerm_linux_virtual_machine.vm_t.name
}

output "virutalmachine_sku_out" {
    value = var.image_sku
}

output "virtualmachine_network_interface_ids_out" {
  value     = var.network_interface_ids
  #sensitive = true
}
output "virutalmachine_computer_name_out" {
  value = azurerm_linux_virtual_machine.vm_t.computer_name
}

