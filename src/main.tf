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

# Define locals
locals {
  postfixed = "terraformdemo"
}

# Deploy Resource Group
resource "azurerm_resource_group" "rg" {
    name = "rg-${local.postfixed}"
    location = var.region
  
}

# Deploy Azure Key Vault
resource "azurerm_key_vault" "akv" {
  name = "akv-${local.postfixed}"
  location = var.region
  resource_group_name = azurerm_resource_group.rg.name
  sku_name = "standard"
  tenant_id = data.azurerm_client_config.current.tenant_id

}

# Deploy Azure Data Factory
resource "azurerm_data_factory" "adf" {
  name = "adf-${local.postfixed}"
  resource_group_name = azurerm_resource_group.rg.name
  location = var.region  
}

# Deploy Azure Storage Account
resource "azurerm_storage_account" "adls" {
  name = "adls${local.postfixed}"
  resource_group_name = azurerm_resource_group.rg.name
  location = var.region
  account_tier = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled = true
  
}

# Deploy Containers Data Lake
resource "azurerm_storage_container" "containerlanding" {
  name = "landing-zone"
  storage_account_name = azurerm_storage_account.adls.name
  container_access_type = "private"
  
}

resource "azurerm_storage_container" "containerbronze" {
  name = "bronze"
  storage_account_name = azurerm_storage_account.adls.name
  container_access_type = "private"
  
}

resource "azurerm_storage_container" "containersilver" {
  name = "silver"
  storage_account_name = azurerm_storage_account.adls.name
  container_access_type = "private"
  
}

resource "azurerm_storage_container" "containergold" {
  name = "gold"
  storage_account_name = azurerm_storage_account.adls.name
  container_access_type = "private"
  
}

# Deploy Azure Databricks
resource "azurerm_databricks_workspace" "databricks" {
  name = "adb-${local.postfixed}"
  resource_group_name = azurerm_resource_group.rg.name
  location = var.region
  sku = "premium"
  managed_resource_group_name = "rg-adb-${local.postfixed}"  
}