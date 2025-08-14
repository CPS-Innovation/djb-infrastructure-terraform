module "dev_network" {
  source               = "../../../modules/network"
  vnet_rg              = var.vnet_rg
  virtual_network_name = data.azurerm_virtual_network.vnet-djb-preprod.name
  subnets              = var.subnets
}
