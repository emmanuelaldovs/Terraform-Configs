terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.20.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "f9579e25-ba01-42f9-8531-333303ea68de"
  features {}
}