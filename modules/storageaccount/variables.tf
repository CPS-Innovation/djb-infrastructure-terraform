variable "tags" {
  type = map(string)
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

variable "sa_name" {
  type        = string
  description = "The name of the Storage Account"
}
