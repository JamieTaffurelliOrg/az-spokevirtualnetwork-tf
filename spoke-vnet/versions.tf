terraform {
  required_providers {
    azurerm = {
      configuration_aliases = [azurerm.logs, azurerm.dns, azurerm.hub]
      source                = "hashicorp/azurerm"
      version               = "~> 3.20"
    }
  }
  required_version = "~> 1.5.0"
}
