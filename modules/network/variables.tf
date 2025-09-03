variable "location" {
  type        = string
  description = "The location of the virtual network"
}

variable "private_dns_zones" {
  type        = map(string)
  description = "A map of subresource names to their respective private DNS zone names. e.g. { sites = \"privatelink.azurewebsites.net\" }"
}

# Subnet
variable "vnet_rg" {
  type        = string
  description = "The name of the virtual network in which to create the subnet"
}

variable "virtual_network_name" {
  type        = string
  description = "The name of the virtual network to which to attach the subnet. Changing this forces a new resource to be created"
}

variable "virtual_network_id" {
  type        = string
  description = "The id of the virtual network to link to the private dns zone."
}

variable "subnets" {
  type = map(object(
    {
      address_prefixes   = list(string)
      service_endpoints  = list(string)
      service_delegation = bool
  }))
}

variable "route_table_id" {
  type        = string
  description = "The resource ID of the Route Table which should be associated with the Subnet. Changing this forces a new resource to be created"
}

# Network Security Group
variable "create_nsg" {
  type    = bool
  default = true
}

variable "nsg_name" {
  type        = string
  description = "Specifies the name of the network security group."
}

variable "nsg_id" {
  type        = string
  description = "The resource ID of an existing NSG. Must be defined when var.create_nsg == false."
  default     = ""
}

variable "nsg_rules" {
  type = map(object({
    priority                     = number
    direction                    = string
    access                       = string
    protocol                     = string
    source_port_range            = optional(string)
    source_port_ranges           = optional(list(string))
    destination_port_range       = optional(string)
    destination_port_ranges      = optional(list(string))
    source_address_prefix        = optional(string)
    source_address_prefixes      = optional(list(string))
    destination_address_prefix   = optional(string)
    destination_address_prefixes = optional(list(string))
  }))
  description = "A map of NSG rules to their properties. For destination and source addresses, either 'prefix' or 'prefixes' must be present."
  default = {
    AllowAmzWorkspcCustom443Inbound = {
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefixes    = ["10.7.152.0/23", "10.7.150.0/23"]
      destination_address_prefix = "*"
    }
  }
}

variable "tags" {
  type        = map(string)
  description = "A map of tag names to values."
  default     = {}
}
