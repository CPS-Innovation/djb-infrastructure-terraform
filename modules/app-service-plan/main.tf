resource "azurerm_service_plan" "service_plan" {
  name                = var.asp_name
  resource_group_name = var.main_rg_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "B2"
}
