resource "azurerm_linux_virtual_machine" "vm_t" {
  name                              = var.vm_name
  location                          = var.location
  resource_group_name               = var.resource_group_name
  network_interface_ids             = var.network_interface_ids
  size                              = var.vm_size
  computer_name                     = var.computer_name
  admin_username                    = var.admin_username
  disable_password_authentication   = var.disable_password_authentication

  os_disk {
    name                 = var.os_disk_name
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_type
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.public_key
  }

  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }
}
