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

# Network Security Group
variable "nsg_name" {
  type        = string
  description = "Specifies the name of the network security group. Changing this forces a new resource to be created"
}

variable "main_rg_name" {
  type        = string
  description = "The name of the resource group in which to create the resource."
}

variable "location" {
  type        = string
  description = "The location of the virtual network"
}

variable "tags" {
  type        = map(string)
  description = "A map of tag names to values."
}

variable "security_rule_name" {
  type        = string
  description = "The name of the security rule"
}

variable "security_rule_priority" {
  type        = number
  description = "The security rule priority"
}

variable "security_rule_direction" {
  type        = string
  description = "The security rule direction"
}

variable "security_rule_protocol" {
  type        = string
  description = "The security rule protocol"
}

variable "route_table_id" {
  type        = string
  description = "The ID of the Route Table which should be associated with the Subnet. Changing this forces a new resource to be created"
}

variable "private_dns_zones" {
  type        = map(string)
  description = "A map of subresource names to their respective private DNS zone names. e.g. { sites = \"privatelink.azurewebsites.net\" }"
}
