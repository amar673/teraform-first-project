provider "azurerm" {
  features {}
}
 
resource "azurerm_resource_group" "terra" {
  name     = "terra"
  location = "East US"  # Change to correct location if needed
}
 
resource "random_integer" "rand" {
  min = 1000
  max = 9999
}
 
resource "azurerm_storage_account" "mystorage" {
  name                     = "mystoracct${random_integer.rand.result}"
  resource_group_name      = azurerm_resource_group.terra.name
  location                 = azurerm_resource_group.terra.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}