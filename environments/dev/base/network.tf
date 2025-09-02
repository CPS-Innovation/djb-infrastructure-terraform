module "network" {
  source               = "../../../modules/network"
  vnet_rg              = var.vnet_rg
  virtual_network_name = data.azurerm_virtual_network.vnet-djb.name
  virtual_network_id   = data.azurerm_virtual_network.vnet-djb.id
  subnets              = var.subnets

  create_nsg        = true
  nsg_name          = var.nsg_name
  location          = var.location
  main_rg_name      = var.main_rg_name
  route_table_id    = data.azurerm_route_table.djb-rt.id
  private_dns_zones = var.private_dns_zones

  tags = {
    environment = var.environment
  }
}
