variable "main_rg_name" {
  type        = string
  description = "The name of the resource group in which to create the subnet"
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created"
}

variable "asp_name" {
  type        = string
  description = "Specifies the name of the App Service Plan component. Changing this forces a new resource to be created."
}

variable "environment" {
  type        = string
  description = "The deployment environment"
}

variable "vnet_name" {
  type        = string
  description = "The name of the virtual network in which to create the subnet"
}

variable "vnet_rg" {
  type        = string
  description = "The name of the virtual network in which to create the subnet"
}
