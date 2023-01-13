variable "resource_group_name" {
  type        = string
  description = "Resource Group name to deploy to"
}

variable "location" {
  type        = string
  description = "Location of the Virtual Network"
}

variable "network_security_groups" {
  type = list(object(
    {
      name                = string
      resource_group_name = string
      rules = list(object(
        {
          name                         = string
          description                  = string
          priority                     = number
          direction                    = string
          access                       = string
          protocol                     = string
          source_port_ranges           = optional(list(string))
          source_port_range            = optional(string)
          destination_port_ranges      = optional(list(string))
          destination_port_range       = optional(string)
          source_address_prefix        = optional(string)
          source_address_prefixes      = optional(list(string))
          destination_address_prefix   = optional(string)
          destination_address_prefixes = optional(list(string))
        }
      ))
    }
  ))
  default     = []
  description = "Network Security Groups to deploy"
}

variable "route_tables" {
  type = list(object(
    {
      name                          = string
      resource_group_name           = string
      disable_bgp_route_propagation = optional(bool, true)
      routes = list(object(
        {
          name                   = string
          address_prefix         = string
          next_hop_type          = string
          next_hop_in_ip_address = optional(string)
        }
      ))
    }
  ))
  default     = []
  description = "Route Tables to deploy"
}

variable "virtual_network_name" {
  type        = string
  description = "Name of the Virtual Network to deploy"
}

variable "virtual_network_address_space" {
  type        = list(string)
  description = "Address space of the Virtual Network to deploy"
}

variable "subnets" {
  type = list(object(
    {
      name                                          = string
      address_prefixes                              = list(string)
      service_endpoints                             = optional(list(string))
      service_endpoint_policy_ids                   = optional(list(string))
      private_endpoint_network_policies_enabled     = optional(bool, true)
      private_link_service_network_policies_enabled = optional(bool, true)
      network_security_group_reference              = string
      route_table_reference                         = string
      delegation                                    = optional(string)
      delegation_actions                            = optional(list(string))
    }
  ))
  description = "Subnets to deploy"
}

variable "private_dns_zones" {
  type = list(object(
    {
      resource_group_name = string
      name                = string
    }
  ))
  default     = []
  description = "Link virtual network to private dns zones"
}

variable "network_watcher_name" {
  type        = string
  description = "Name of Network Watcher to send diagnostics"
}

variable "network_watcher_resource_group_name" {
  type        = string
  description = "Resource Group of Network Watcher to send diagnostics"
}

variable "log_analytics_workspace_name" {
  type        = string
  description = "Name of Log Analytics Workspace to send diagnostics"
}

variable "log_analytics_workspace_resource_group_name" {
  type        = string
  description = "Resource Group of Log Analytics Workspace to send diagnostics"
}

variable "storage_account_name" {
  type        = string
  description = "Name of storage account to send diagnostics"
}

variable "storage_account_resource_group_name" {
  type        = string
  description = "Resource Group of storage account to send diagnostics"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply"
}
