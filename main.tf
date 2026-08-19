resource "azurerm_resource_group" "rg" {
  for_each = var.resource_group
  name     = each.value.name
  location = each.value.location
}
resource "azurerm_storage_account" "st12" {
    depends_on = [azurerm_resource_group.rg]
  for_each = var.resource_group
  name                     = "stgarvindaa"
  resource_group_name      = azurerm_resource_group.rg[each.key].name
  location                 = azurerm_resource_group.rg[each.key].location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
