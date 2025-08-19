module "fa_storage_account" {
  source = "../../../modules/storageaccount"

  sa_name      = "sadjbserviceapps${var.environment}"
  location     = var.location
  main_rg_name = module.rg.rg_name

  tags = local.tags
}

resource "azurerm_private_endpoint" "fa_storage_account" {
  name                = "pe-${module.fa_storage_account.storage_account_name}"
  location            = var.location
  resource_group_name = module.rg.rg_name
  subnet_id           = data.azurerm_subnet.base["subnet-djb-service-${var.environment}"].id

  private_service_connection {
    name                           = module.fa_storage_account.storage_account_name
    private_connection_resource_id = module.fa_storage_account.storage_account_id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "sa-dns-zone-group"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns["blob"].id]
  }

  tags = local.tags
}
