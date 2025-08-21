resource "azurerm_private_dns_zone" "dns" {
  for_each            = var.private_dns_zones
  name                = each.value
  resource_group_name = var.vnet_rg
}
