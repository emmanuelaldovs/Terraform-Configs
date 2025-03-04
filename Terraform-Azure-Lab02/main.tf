resource "random_pet" "rg_name_t" {
  prefix = var.resource_group_name_prefix
}

resource "azurerm_resource_group" "rg_t" {
  location = var.resource_group_location
  name     = random_pet.rg_name_t.id  # el .id trae el nombre completo, es decir rg-xxx-yy
}

# Create virtual network
resource "azurerm_virtual_network" "my_terraform_network_t" {
  name                = "myVnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg_t.location
  resource_group_name = azurerm_resource_group.rg_t.name
}

# Create subnet
resource "azurerm_subnet" "my_terraform_subnet_t" {
  name                 = "mySubnet"
  resource_group_name  = azurerm_resource_group.rg_t.name
  virtual_network_name = azurerm_virtual_network.my_terraform_network_t.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create public IPs
resource "azurerm_public_ip" "my_terraform_public_ip_t" {
  name                = "myPublicIP"
  location            = azurerm_resource_group.rg_t.location
  resource_group_name = azurerm_resource_group.rg_t.name
  #allocation_method   = "Dynamic"
  allocation_method   = "Static"
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "my_terraform_nsg_t" {
  name                = "myNetworkSecurityGroup"
  location            = azurerm_resource_group.rg_t.location
  resource_group_name = azurerm_resource_group.rg_t.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Create network interface
resource "azurerm_network_interface" "my_terraform_nic_t" {
  name                = "myNIC"
  location            = azurerm_resource_group.rg_t.location
  resource_group_name = azurerm_resource_group.rg_t.name

  ip_configuration {
    name                          = "my_nic_configuration"
    subnet_id                     = azurerm_subnet.my_terraform_subnet_t.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.my_terraform_public_ip_t.id
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "example_t" {
  network_interface_id      = azurerm_network_interface.my_terraform_nic_t.id
  network_security_group_id = azurerm_network_security_group.my_terraform_nsg_t.id
}

# Generate random text for a unique storage account name
resource "random_id" "random_id_t" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = azurerm_resource_group.rg_t.name
  }

  byte_length = 8
}

# Create storage account for boot diagnostics
resource "azurerm_storage_account" "my_storage_account_t" {
  name                     = "diag${random_id.random_id_t.hex}"
  location                 = azurerm_resource_group.rg_t.location
  resource_group_name      = azurerm_resource_group.rg_t.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Create (and display) an SSH key
resource "tls_private_key" "example_ssh_t" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "my_terraform_vm_t" {
  name                  = "myVM"
  location              = azurerm_resource_group.rg_t.location
  resource_group_name   = azurerm_resource_group.rg_t.name
  network_interface_ids = [azurerm_network_interface.my_terraform_nic_t.id]
  size                  = "Standard_DS1_v2"

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  computer_name                   = "myvm"
  admin_username                  = "azureuser"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "azureuser"
    public_key = tls_private_key.example_ssh_t.public_key_openssh
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.my_storage_account_t.primary_blob_endpoint
  }
}