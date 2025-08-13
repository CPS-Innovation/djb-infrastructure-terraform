variable "main_rg" {
  type        = string
  description = "The name of the resource group in which to create the subnet"
}

variable "location" {
  type        = string
  description = "The location of the virtual network"
}

variable "vnet_rg" {
  type        = string
  description = "The name of the virtual network in which to create the subnet"
}

# variable "virtual_network_name" {
#   type        = string
#   description = "The name of the virtual network to which to attach the subnet. Changing this forces a new resource to be created"
# }

# variable "address_prefixes" {
#   type        = string
#   description = "The address prefixes to use for the subnet"
# }


# variable "service_endpoints" {
#   type        = string
#   description = "The list of Service endpoints to associate with the subnet"
# }

# variable "network_security_group_id" {
#   type        = string
#   description = "The ID of the Network Security Group which should be attached to the Network Interface. Changing this forces a new resource to be created"
# }

# variable "route_table_id" {
#   type        = string
#   description = " The ID of the Route Table which should be associated with the Subnet. Changing this forces a new resource to be created"
# }

variable "vnet_name" {
  type        = string
  description = "The name of the virtual network in which to create the subnet"
}

variable "rt_djb_name" {
  type        = string
  description = "Name of the Routing Table"
}

variable "subnets" {
  type = map(object(
    {
      address_prefixes   = list(string)
      service_endpoints  = list(string)
      service_delegation = bool
  }))
}

# variable "nsg_djb_name" {
#   type        = string
#   description = "Name of the Network Security Group"
# }
