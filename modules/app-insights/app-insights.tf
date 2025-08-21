resource "azurerm_application_insights" "ai" {
  name                = "ai-djb-${var.environment}"
  location            = var.location
  resource_group_name = var.main_rg_name
  application_type    = "web"
  workspace_id        = azurerm_log_analytics_workspace.law.id

  tags = var.tags
}
