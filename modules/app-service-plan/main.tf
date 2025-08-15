resource "azurerm_app_service_plan" "service_plan" {
  name                = var.asp_name
  location            = var.location
  resource_group_name = var.main_rg_name
  kind                = "Linux"

  sku {
    tier = "Basic"
    size = "B2"
  }
}
