module "network_dev" {
  source               = "../../../modules/network"
  main_rg              = var.main_rg
  vnet_rg              = var.vnet_rg
  subnets              = var.subnets
  location             = var.location
  route_table_id       = data.azurerm_route_table.djb-rt.id
  address_prefixes     = each.value.address_prefixes
  service_endpoints    = each.value.service_endpoints
  virtual_network_name = data.azurerm_virtual_network.vnet-djb-preprod.name
  # network_security_group_id = data.azurerm_network_security_group.djb-nsg.id
}
