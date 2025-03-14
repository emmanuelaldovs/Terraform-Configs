/*
output "ResourceGroup_Main_name_out" {
    value = module.ResourceGroup.ResourceGroup_name_out
}

output "ResourceGroup_Main_id_out" {
    value = module.ResourceGroup.ResourceGroup_id_out
}

output "VirtualNetwork_Main_name_out" {
    value = module.VirtualNetwork.VirtualNetwork_name_out
}

output "VirtualNetwork_Main_address_space_out" {
    #value = module.VirtualNetwork.VirtualNetwork_AddressSpace_out
    value = join(", ",module.VirtualNetwork.VirtualNetwork_AddressSpace_out)
}

output "NetworkSecurityGroup_Main_name_out" {
    value = module.NetworkSecurityGroup.NetworkSecurityGroup_name_out
}

output "NetworkSecurityGroup_Main_id_out" {
    value = module.NetworkSecurityGroup.NetworkSecurityGroup_id_out
}

output "Subnet_Main_name_out" {
    value = module.Subnet.Subnet_name_out
}

output "Subnet_address_space_out" {
    #value = module.Subnet.Subnet_AddressSpace_out #lo imprime con toset([
    value = join(", ",module.Subnet.Subnet_AddressSpace_out)
}
*/
output "formatted_output" {
  value = <<EOT
=========================================
🏗️  Terraform Deployment Summary 🚀
=========================================

1️⃣ **Resource Group**
   - Name: ${module.ResourceGroup.ResourceGroup_name_out}
   - Location: ${module.ResourceGroup.ResourceGroup_id_out}

2️⃣ **Virtual Network**
   - Name: ${module.VirtualNetwork.VirtualNetwork_name_out}
   - Address Space: ${join(", ", module.VirtualNetwork.VirtualNetwork_AddressSpace_out)}

3️⃣ **Subnet**
   - Name: ${module.Subnet.Subnet_name_out}
   - Address Prefixes: ${join(", ", module.Subnet.Subnet_AddressSpace_out)}

4️⃣ **Network Security Group**
   - Name: ${module.NetworkSecurityGroup.NetworkSecurityGroup_name_out}
   - ID: ${module.NetworkSecurityGroup.NetworkSecurityGroup_id_out}

5️⃣ **PublicIP**
   - Name: ${module.PublicIp.PublicIp_name_out}
   - ID: ${module.PublicIp.PublicIp_address_ip_out}

6️⃣ **NetworkInterface**
   - Name: ${module.NetworkInterface.NetworkInterface_name_out}
   - ID: ${module.NetworkInterface.NetworkInterface_id_out}

7️⃣ **SecurityGrouptoNetworkInterface**
    - Name: ${module.SecurityGrouptoNetworkInterface.Security_group_to_nic_id_out}

8️⃣ **RandomId**
    - Id_hex: ${module.RandomId.RandomId_id_hex_out}

9️⃣ **StorageAccount**
    - Name: ${module.StorageAccount.StorageAccount_name_out}
    - ID: ${module.StorageAccount.StorageAccount_id_out}

🔟 **TLSPrivateKey**
    - Algorithm: ${module.TlsPrivateKey.privateKey_algorithm_out}
    - Rsa_bits: ${module.TlsPrivateKey.privateKey_rsa_bits_out}    
    - Public_key_openssh_out: ${module.TlsPrivateKey.public_key_openssh_out}

1️⃣1️⃣ **Virtual Machine**
    - Name: ${module.VirtualMachine.virutalmachine_name_out}
    - SKU: ${module.VirtualMachine.virutalmachine_sku_out}
    - Network Interfaces:  ${join(", ", module.VirtualMachine.virtualmachine_network_interface_ids_out)}    
    - Network Interfaces 2:  ${join(", ", [module.NetworkInterface.NetworkInterface_id_out])}    
    - Computer Name: ${module.VirtualMachine.virutalmachine_computer_name_out}


=========================================
🎉 Terraform Deployment Completed Successfully! ✅
=========================================
EOT    
#- Private_key_pem_out: ${module.TlsPrivateKey.private_key_pem_out} 
#
}
