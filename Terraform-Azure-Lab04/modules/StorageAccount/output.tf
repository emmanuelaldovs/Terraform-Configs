output "StorageAccount_name_out" {
    value = azurerm_storage_account.my_storage_account_t.name
}

output "StorageAccount_id_out" {
    value = azurerm_storage_account.my_storage_account_t.id
}

output "StorageAccount_uri_out" {
    value = azurerm_storage_account.my_storage_account_t.primary_blob_endpoint
}