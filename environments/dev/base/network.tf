module "dev_network" {
  source               = "../../../modules/network"
  vnet_rg              = var.vnet_rg
  virtual_network_name = data.azurerm_virtual_network.vnet-djb-preprod.name
  subnets              = var.subnets

  nsg_name                = var.nsg_name
  location                = var.location
  main_rg_name            = var.main_rg_name
  security_rule_name      = var.security_rule_name
  security_rule_priority  = var.security_rule_priority
  security_rule_protocol  = var.security_rule_protocol
  security_rule_direction = var.security_rule_direction
}
