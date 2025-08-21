variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created"
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

variable "fa_cors_allowed_origins" {
  type        = list(string)
  description = "A list of origins that should be allowed to make cross-origin calls."
}
