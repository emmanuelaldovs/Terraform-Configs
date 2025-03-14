output "Security_group_to_nic_id_out" { # intenté usar el nombre SecurityGrouptoNetworkInterface_id_out, pero no me dejó.
    value = azurerm_network_interface_security_group_association.example_t.id
}
