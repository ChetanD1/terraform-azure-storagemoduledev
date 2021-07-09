resource "azurerm_resource_group" "chetan-rg1" {
  name     = var.resourcegroup
  location = "Central India"
}

resource "azurerm_storage_account" "chetan-sa" {
  name                     = var.storageaccount
  resource_group_name      = azurerm_resource_group.chetan-rg1.name
  location                 = azurerm_resource_group.chetan-rg1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "chetan-sc" {
  name                  = var.containername
  storage_account_name  = azurerm_storage_account.chetan-sa.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "chetanblob" {
  name                   = "chetanblob"
  storage_account_name   = azurerm_storage_account.chetan-sa.name
  storage_container_name = azurerm_storage_container.chetan-sc.name
  type                   = "Block"
  source                 = "C:/Users/chetan.dhadiwal/Downloads/Demo5Modules/Demo5Modules/modules/storageaccount/Demo.zip"
}