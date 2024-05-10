# Create Cosmos DB Account
resource "azurerm_cosmosdb_account" "cosmosdb" {
  name                = "testcosmosdb6798" // Updated name to meet requirements
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_resource_group.rg1.location
  offer_type          = "Standard"
  kind                = "MongoDB"

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = azurerm_resource_group.rg1.location
    failover_priority = 0
  }

  tags = {
    environment = "dev"
  }
}

# Create Cosmos DB Database
resource "azurerm_cosmosdb_mongo_database" "db" {
  name                = "testdb"
  account_name        = azurerm_cosmosdb_account.cosmosdb.name
  resource_group_name = azurerm_resource_group.rg1.name
  throughput          = 400
}
