variable "tags" {
  type        = map(string)
  description = "A map of tag names to values."
}

variable "fa_name" {
  type        = string
  description = "The name of the function app."
}

variable "main_rg_name" {
  type        = string
  description = "The name of the resource group in which to create the resource."
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "sa_name" {
  type        = string
  description = "The name of the storage account associated with the function app."
}

variable "sa_id" {
  type        = string
  description = "The resource id of the associated storage account."
}

variable "sa_roles" {
  type        = set(string)
  description = "A set of role definition names to assign to the function app for the storage account scope."
}

variable "kv_id" {
  type        = string
  description = "The resource id of the key vault holding the app's sensitive variable values."
}

variable "asp_id" {
  type        = string
  description = "The resource id of the App Service Plan within which the function app runs."
}

variable "fa_subnet_id" {
  type        = string
  description = "The resource id of the subnet through which the function app is integrated into the VNet."
}

variable "ai_connection_string" {
  type        = string
  description = "The connection string for the application insights instance to associate with the function app."
}

variable "always_on" {
  type        = bool
  description = "Determines whether the always_on feature is enabled for the function app."
  default     = false
}

variable "cors_allowed_origins" {
  type        = list(string)
  description = "A list of origins that should be allowed to make cross-origin calls."
  nullable    = true
}

variable "pe_subnet_id" {
  type        = string
  description = "The id of the subnet within which the Private Endpoint IP is located."
}

variable "private_dns_zone_ids" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include within the private_dns_zone_group"
}
