# Create Storage Account
resource "azurerm_storage_account" "storage" {
  name                     = "kritistorageaccount0987"
  resource_group_name      = azurerm_resource_group.rg1.name
  location                 = azurerm_resource_group.rg1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "dev"
  }
}

# Create Blob Container
resource "azurerm_storage_container" "conatiner" {
  name                  = "testcontainer"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private" # Change as needed

  depends_on = [azurerm_storage_account.storage]
}
