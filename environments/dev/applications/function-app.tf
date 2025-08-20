module "fa" {
  source = "../../../modules/function-app"

  fa_name = "fa-djb-transfer-tool-${var.environment}"
  main_rg_name = module.rg.rg_name
  location = var.location
  asp_id = module.app_service_plan.app_service_plan_id
  sa_name = module.fa_storage_account.storage_account_name
  fa_subnet_id = data.azurerm_subnet.base["subnet-djb-service-apps-${var.environment}"].id
  cors_allowed_origins = var.fa_cors_allowed_origins
  ai_connection_string = module.monitoring.ai_connection_string
  # Private Endpoint: 
  pe_subnet_id = local.pe_subnet_id
  private_dns_zone_ids = [ data.azurerm_private_dns_zone.dns["sites"].id ]
  # IAM:
  sa_id = module.fa_storage_account.storage_account_id
  sa_roles = [
      "Storage Blob Data Owner",
      "Storage Table Data Contributor"
  ]

  tags = local.tags
}