module "sa-blob-pe" {
  source = "../../../modules/private-endpoint"

  subnet_id            = data.azurerm_subnet.base["subnet-djb-service-dev"].id
  location             = var.location
  main_rg_name         = var.main_rg_name
  environment          = var.environment
  storage_account_id   = module.fa_storage_account.storage_account_id
  storage_account_name = module.fa_storage_account.storage_account_name
  private_dns_zone_ids = data.azurerm_private_dns_zone.blob_djb_preprod.id
}
