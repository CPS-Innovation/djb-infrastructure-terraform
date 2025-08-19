module "fa" {
    source = "../../../modules/function-app"

    fa_name = "fa-djb-transfer-tool-${var.environment}"
    main_rg_name = module.rg.rg_name
    location = var.location
    asp_id = module.app_service_plan.app_service_plan_id
    sa_name = module.fa_storage_account.storage_account_name
    sa_id = module.fa_storage_account.storage_account_id
    sa_roles = [
        "Storage Blob Data Owner",
        "Storage Table Data Contributor"
    ]
    fa_subnet_id = data.azurerm_subnet.base["subnet-djb-service-apps-${var.environment}"].id
    cors_allowed_origins = var.fa_cors_allowed_origins
    ai_connection_string = azurerm_application_insights.ai.connection_string

    tags = local.tags
}

resource "azurerm_private_endpoint" "fa" {
  name                = "pe-${module.fa.fa_name}"
  location            = var.location
  resource_group_name = module.rg.rg_name
  subnet_id           = data.azurerm_subnet.base["subnet-djb-service-${var.environment}"].id

  private_service_connection {
    name                           = module.fa.fa_name
    private_connection_resource_id = module.fa.fa_id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "fa-dns-zone-group"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dnb["sites"].id]
  }

  tags = local.tags
}