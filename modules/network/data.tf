data "azurerm_network_security_group" "nsg" {
  count               = var.create_nsg ? 0 : 1
  name                = var.nsg_name
  resource_group_name = var.vnet_rg
}
