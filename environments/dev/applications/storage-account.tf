module "fa_storage_account" {
  source = "../../../modules/storageaccount"

  location             = var.location
  subnet_id            = data.azurerm_subnet.base["subnet-djb-service-dev"].id
  main_rg_name         = var.main_rg_name
  environment          = var.environment
  private_dns_zone_ids = data.azurerm_private_dns_zone.blob_djb_preprod.id

}
