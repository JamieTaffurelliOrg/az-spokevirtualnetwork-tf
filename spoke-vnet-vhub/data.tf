data "azurerm_virtual_hub" "hub" {
  for_each            = var.hub_connection == null ? [] : [var.hub_connection]
  provider            = azurerm.hub
  name                = var.hub_connection.name
  resource_group_name = var.hub_connection.resource_group_name
}

data "azurerm_log_analytics_workspace" "logs" {
  provider            = azurerm.logs
  name                = var.log_analytics_workspace_name
  resource_group_name = var.log_analytics_workspace_resource_group_name
}

data "azurerm_storage_account" "logs" {
  provider            = azurerm.logs
  name                = var.storage_account_name
  resource_group_name = var.storage_account_resource_group_name
}

data "azurerm_network_ddos_protection_plan" "ddos_protection" {
  for_each            = var.ddos_protection == null ? [] : [var.ddos_protection]
  provider            = azurerm.ddos
  name                = var.ddos_protection.name
  resource_group_name = var.ddos_protection.resource_group_name
}
