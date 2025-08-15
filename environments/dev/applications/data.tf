# data "azurerm_private_dns_zone" "blob_djb_preprod" {
#   name                = "privatelink.blob.core.windows.net"
#   resource_group_name = "rg-djb-preprod"
# }


# # All subnets of the vnet above.
# # To reference a specific subnet use data.azurerm_subnet.base["<subnet-name>"].id
# data "azurerm_virtual_network" "vnet-djb-preprod" {
#   name                = var.vnet_name
#   resource_group_name = var.vnet_rg
# }

# data "azurerm_subnet" "base" {
#   for_each = toset(data.azurerm_virtual_network.vnet-djb-preprod.subnets)

#   name                 = each.value
#   virtual_network_name = var.vnet_name
#   resource_group_name  = var.vnet_rg
# }
