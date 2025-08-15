variable "vnet_rg" {
  type        = string
  description = "The name of the virtual network in which to create the subnet"
}

variable "subnets" {
  type = map(object(
    {
      address_prefixes   = list(string)
      service_endpoints  = list(string)
      service_delegation = bool
  }))
}

variable "vnet_name" {
  type        = string
  description = "The name of the virtual network in which to create the subnet"
}


# Network Security Group
variable "nsg_name" {
  type        = string
  description = "Specifies the name of the network security group. Changing this forces a new resource to be created"
}

variable "main_rg_name" {
  type        = string
  description = "The name of the resource group in which to create the subnet"
}

variable "location" {
  type        = string
  description = "The location of the virtual network"
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

variable "rt_djb_name" {
  type        = string
  description = " The name of the Route Table which should be associated with the Subnet. Changing this forces a new resource to be created"
}
