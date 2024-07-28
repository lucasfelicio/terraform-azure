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

# Deploy Azure Key Vault

# Deploy Azure Data Factory

# Deploy Azure Storage Account

# Deploy Azure Databricks