variable "environment" {
  type        = string
  description = "The deployment environment"
}

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

variable "location" {
  type        = string
  description = "The location of the virtual network"
}

variable "rt_djb_name" {
  type        = string
  description = " The name of the Route Table which should be associated with the Subnet. Changing this forces a new resource to be created"
}

variable "private_dns_zones" {
  type        = map(string)
  description = "A map of subresource names to their respective private DNS zone names. e.g. { sites = \"privatelink.azurewebsites.net\" }"
  default     = {}
}
