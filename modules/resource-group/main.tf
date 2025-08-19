resource "azurerm_resource_group" "main" {
  name     = var.main_rg_name
  location = var.location

  tags = var.tags
}
