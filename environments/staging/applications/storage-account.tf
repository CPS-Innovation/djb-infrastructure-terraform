module "fa_storage_account" {
  source = "../../../modules/storageaccount"

  sa_name      = "sadjbserviceapps${var.environment}"
  location     = var.location
  main_rg_name = module.rg.rg_name
  # Private Endpoint:
  pe_subnet_id         = local.pe_subnet_id
  private_dns_zone_ids = [data.azurerm_private_dns_zone.dns["blob"].id]

  tags = local.tags
}
