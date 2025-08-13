data "azurerm_virtual_network" "vnet-djb-preprod" {
  name                = var.vnet_name
  resource_group_name = var.vnet_rg
}

# data "azurerm_network_security_group" "djb-nsg" {
#   name                = var.nsg_djb_name
#   resource_group_name = var.vnet_rg
# }

data "azurerm_route_table" "djb-rt" {
  name                = var.rt_djb_name
  resource_group_name = var.vnet_rg
}
