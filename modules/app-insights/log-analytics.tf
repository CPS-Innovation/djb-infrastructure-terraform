resource "azurerm_log_analytics_workspace" "law" {
  name                = "log-analytics-djb-${var.environment}"
  location            = var.location
  resource_group_name = var.main_rg_name
  sku                 = "PerGB2018"
  retention_in_days   = 60

  tags = var.tags
}
