<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.6.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.20 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.65.0 |
| <a name="provider_azurerm.ddos"></a> [azurerm.ddos](#provider\_azurerm.ddos) | 3.65.0 |
| <a name="provider_azurerm.dns"></a> [azurerm.dns](#provider\_azurerm.dns) | 3.65.0 |
| <a name="provider_azurerm.hub"></a> [azurerm.hub](#provider\_azurerm.hub) | 3.65.0 |
| <a name="provider_azurerm.logs"></a> [azurerm.logs](#provider\_azurerm.logs) | 3.65.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_diagnostic_setting.network_security_group_diagnostics](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.virtual_network_diagnostics](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_network_security_group.nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_rule.nsg_rules](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_watcher_flow_log.network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_watcher_flow_log) | resource |
| [azurerm_private_dns_zone_virtual_network_link.dns_vnet_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_subnet.subnets](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.nsg_join](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_hub_connection.network_hub_connection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_hub_connection) | resource |
| [azurerm_virtual_network.network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network_dns_servers.network_dns](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_dns_servers) | resource |
| [azurerm_log_analytics_workspace.logs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/log_analytics_workspace) | data source |
| [azurerm_network_ddos_protection_plan.ddos_protection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/network_ddos_protection_plan) | data source |
| [azurerm_storage_account.logs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account) | data source |
| [azurerm_virtual_hub.hub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_hub) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ddos_protection"></a> [ddos\_protection](#input\_ddos\_protection) | DDOS protection plan to attach to the virtual network | <pre>object({<br>    name                = string<br>    resource_group_name = string<br>    enabled             = optional(bool, true)<br>  })</pre> | `null` | no |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | DNS servers to query from the virtual network | `list(string)` | `[]` | no |
| <a name="input_hub_connection"></a> [hub\_connection](#input\_hub\_connection) | Connection to secured virtual hub | <pre>object({<br>    name                      = string<br>    resource_group_name       = string<br>    internet_security_enabled = optional(bool, true)<br>  })</pre> | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Location of the Virtual Network | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#input\_log\_analytics\_workspace\_name) | Name of Log Analytics Workspace to send diagnostics | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_resource_group_name"></a> [log\_analytics\_workspace\_resource\_group\_name](#input\_log\_analytics\_workspace\_resource\_group\_name) | Resource Group of Log Analytics Workspace to send diagnostics | `string` | n/a | yes |
| <a name="input_network_security_groups"></a> [network\_security\_groups](#input\_network\_security\_groups) | Network Security Groups to deploy | <pre>list(object(<br>    {<br>      name                = string<br>      resource_group_name = string<br>      rules = list(object(<br>        {<br>          name                         = string<br>          description                  = string<br>          priority                     = number<br>          direction                    = string<br>          access                       = string<br>          protocol                     = string<br>          source_port_ranges           = optional(list(string))<br>          source_port_range            = optional(string)<br>          destination_port_ranges      = optional(list(string))<br>          destination_port_range       = optional(string)<br>          source_address_prefix        = optional(string)<br>          source_address_prefixes      = optional(list(string))<br>          destination_address_prefix   = optional(string)<br>          destination_address_prefixes = optional(list(string))<br>        }<br>      ))<br>    }<br>  ))</pre> | `[]` | no |
| <a name="input_network_watcher_name"></a> [network\_watcher\_name](#input\_network\_watcher\_name) | Name of Network Watcher to send diagnostics | `string` | n/a | yes |
| <a name="input_network_watcher_resource_group_name"></a> [network\_watcher\_resource\_group\_name](#input\_network\_watcher\_resource\_group\_name) | Resource Group of Network Watcher to send diagnostics | `string` | n/a | yes |
| <a name="input_private_dns_zones"></a> [private\_dns\_zones](#input\_private\_dns\_zones) | Link virtual network to private dns zones | <pre>list(object(<br>    {<br>      resource_group_name  = string<br>      name                 = string<br>      registration_enabled = optional(bool, false)<br>    }<br>  ))</pre> | `[]` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource Group name to deploy to | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Name of storage account to send diagnostics | `string` | n/a | yes |
| <a name="input_storage_account_resource_group_name"></a> [storage\_account\_resource\_group\_name](#input\_storage\_account\_resource\_group\_name) | Resource Group of storage account to send diagnostics | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Subnets to deploy | <pre>list(object(<br>    {<br>      name                                          = string<br>      address_prefixes                              = list(string)<br>      service_endpoints                             = optional(list(string))<br>      service_endpoint_policy_ids                   = optional(list(string))<br>      private_endpoint_network_policies_enabled     = optional(bool, true)<br>      private_link_service_network_policies_enabled = optional(bool, true)<br>      network_security_group_reference              = optional(string)<br>      delegation                                    = optional(string)<br>      delegation_actions                            = optional(list(string))<br>    }<br>  ))</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply | `map(string)` | n/a | yes |
| <a name="input_virtual_network_address_space"></a> [virtual\_network\_address\_space](#input\_virtual\_network\_address\_space) | Address space of the Virtual Network to deploy | `list(string)` | n/a | yes |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | Name of the Virtual Network to deploy | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_security_group_id"></a> [network\_security\_group\_id](#output\_network\_security\_group\_id) | Resource IDs of the Network Security Groups |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | The subnets deployed to the Virtual Network |
| <a name="output_virtual_network_address_space"></a> [virtual\_network\_address\_space](#output\_virtual\_network\_address\_space) | Address space of the Virtual Network |
| <a name="output_virtual_network_id"></a> [virtual\_network\_id](#output\_virtual\_network\_id) | Resource ID of the Virtual Network |
| <a name="output_virtual_network_name"></a> [virtual\_network\_name](#output\_virtual\_network\_name) | Name of the Virtual Network |
| <a name="output_virtual_network_resource_group_name"></a> [virtual\_network\_resource\_group\_name](#output\_virtual\_network\_resource\_group\_name) | Resource group of the Virtual Network |
<!-- END_TF_DOCS -->
