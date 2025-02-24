# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
    required_providers {
      azurerm ={
        source = "hashicorp/azurerm"
        version = "4.20.0"      
      }
    }  
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  #resource_provider_registrations = "none" # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  subscription_id = "f9579e25-ba01-42f9-8531-333303ea68de"
  features {}
}

module "ResourceGroup" {
    source = "./modules/ResourceGroup"
    base_name = "myfirstresourcegroup"
    location = "eastus2"  
}

module "StorageAccount" {
    source = "./modules/StorageAccount"
    base_name = "mystorage12345"
    dlgen2_name = "mydatalakegen2terraform"
    resource_group_name = module.ResourceGroup.rg_name_out
    location = module.ResourceGroup.rg_location_out
}
