terraform {
  required_providers {
    azurerm = {
      configuration_aliases = [azurerm.logs, azurerm.hub, azurerm.dns, azurerm.ddos]
      source                = "hashicorp/azurerm"
      version               = "~> 3.20"
    }
  }
  required_version = "~> 1.5.0"
}
