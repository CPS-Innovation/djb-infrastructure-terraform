module "network" {
  source               = "../../../modules/network"
  vnet_rg              = var.vnet_rg
  virtual_network_name = data.azurerm_virtual_network.vnet-djb.name
  virtual_network_id   = data.azurerm_virtual_network.vnet-djb.id
  subnets              = var.subnets

  create_nsg        = false
  nsg_id            = data.azurerm_network_security_group.nsg.id
  nsg_name          = var.nsg_name
  location          = var.location
  route_table_id    = data.azurerm_route_table.djb-rt.id
  private_dns_zones = var.private_dns_zones
}
