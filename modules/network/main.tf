resource "azurerm_subnet" "subnets" {
  for_each = var.subnets

  name                 = each.key
  resource_group_name  = var.vnet_rg # This must be the resource group that the virtual network resides in
  virtual_network_name = var.virtual_network_name
  address_prefixes     = each.value.address_prefixes
  service_endpoints    = each.value.service_endpoints

  dynamic "delegation" {
    for_each = each.value.service_delegation == true ? [1] : []

    content {
      name = "delegation-${each.key}"

      service_delegation {
        name    = "Microsoft.Web/serverFarms"
        actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
      }
    }
  }
}

# Network Security Group
resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.main_rg_name

  security_rule {
    name                       = var.security_rule_name
    priority                   = var.security_rule_priority
    direction                  = var.security_rule_direction
    access                     = "Allow"
    protocol                   = var.security_rule_protocol
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "10.7.152.0/23"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = var.security_rule_name
    priority                   = var.security_rule_priority
    direction                  = var.security_rule_direction
    access                     = "Allow"
    protocol                   = var.security_rule_protocol
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "10.7.150.0/23"
    destination_address_prefix = "*"
  }

  tags = {
    environment = var.environment
  }
}

# resource "azurerm_subnet_network_security_group_association" "nsg_djb_subnet_assoc" {
#   for_each = var.subnets

#   subnet_id                 = azurerm_subnet.subnets[each.key].id
#   network_security_group_id = var.network_security_group_id

#   depends_on = [azurerm_subnet.subnets]
# }

# resource "azurerm_subnet_route_table_association" "djb_rt" {
#   for_each = var.subnets

#   subnet_id      = azurerm_subnet.subnets[each.key].id
#   route_table_id = var.route_table_id

#   depends_on = [azurerm_subnet.subnets]
# }
