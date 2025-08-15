variable "environment" {
  type        = string
  description = "The deployment environment"
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created"
}

variable "main_rg_name" {
  type        = string
  description = "The name of the resource group in which to create the subnet"
}

variable "subnet_id" {
  type        = string
  description = "The ID of the Subnet from which Private IP Addresses will be allocated for this Private Endpoint. Changing this forces a new resource to be created"
}

variable "private_dns_zone_ids" {
  type        = string
  description = "Specifies the list of Private DNS Zones to include within the private_dns_zone_group"
}
