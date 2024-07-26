terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.113.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Deploy Resource Group
resource "azurerm_resource_group" "rg" {
    name = "rg-lakehouse"
    location = "eastus"
  
}

# Deploy Storage Account
resource "azurerm_storage_account" "storage" {
    name = "adlslakehouse"
    account_tier = "Standard"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    account_replication_type = "LRS"
    access_tier = "Hot"
    is_hns_enabled = true
}