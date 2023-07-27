output "network_security_group_id" {
  value       = { for k in azurerm_network_security_group.nsg : k.id => k }
  description = "Resource IDs of the Network Security Groups"
}

output "virtual_network_id" {
  value       = azurerm_virtual_network.network.id
  description = "Resource ID of the Virtual Network"
}

output "virtual_network_name" {
  value       = azurerm_virtual_network.network.name
  description = "Name of the Virtual Network"
}

output "virtual_network_resource_group_name" {
  value       = azurerm_virtual_network.network.resource_group_name
  description = "Resource group of the Virtual Network"
}

output "virtual_network_address_space" {
  value       = azurerm_virtual_network.network.address_space
  description = "Address space of the Virtual Network"
}

output "subnets" {
  value       = { for k, v in azurerm_subnet.subnets : k => v }
  description = "The subnets deployed to the Virtual Network"
}
