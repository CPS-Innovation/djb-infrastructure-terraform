variable "tags" {
  type        = map(string)
  description = "A map of tag names to values."
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created"
}

variable "main_rg_name" {
  type        = string
  description = "The name of the resource group in which to create the resource."
}

variable "kv_name" {
  type        = string
  description = "The name of the key vault."
}

variable "kv_sku" {
  type        = string
  description = "The SKU tier of the key vault."
  default     = "standard"
}

variable "tenant_id" {
  type        = string
  description = "The tenant id of the current subscription."
}

variable "pe_subnet_id" {
  type        = string
  description = "The id of the subnet within which the Private Endpoint IP is located."
}

variable "private_dns_zone_ids" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include within the private_dns_zone_group"
}
