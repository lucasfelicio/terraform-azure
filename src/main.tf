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