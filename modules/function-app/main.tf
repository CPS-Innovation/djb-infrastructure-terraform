resource "azurerm_linux_function_app" "fa" {
  name                          = var.fa_name
  resource_group_name           = var.main_rg_name
  location                      = var.location
  storage_account_name          = var.sa_name
  storage_uses_managed_identity = true
  service_plan_id               = var.asp_id
  virtual_network_subnet_id     = var.fa_subnet_id
  public_network_access_enabled = false
  builtin_logging_enabled       = false
  https_only                    = true
  client_certificate_mode       = "Required"

  site_config {
    vnet_route_all_enabled                 = true
    application_insights_connection_string = var.ai_connection_string
    ftps_state                             = "FtpsOnly"
    always_on                              = var.always_on

    application_stack {
      dotnet_version              = "8.0"
      use_dotnet_isolated_runtime = true
    }

    cors {
      allowed_origins = var.cors_allowed_origins

      support_credentials = true
    }
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [
      app_settings,
      functions_extension_version,
      tags
    ]
  }
}
