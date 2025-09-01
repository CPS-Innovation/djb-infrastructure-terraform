module "kv" {
  source       = "../../../modules/key-vault"
  kv_name      = "kv-djb-${var.environment}"
  location     = var.location
  main_rg_name = module.rg.rg_name
  tenant_id    = data.azurerm_client_config.current.tenant_id
  # Private Endpoint:
  pe_subnet_id         = local.pe_subnet_id
  private_dns_zone_ids = [data.azurerm_private_dns_zone.dns["vault"].id]

  tags = local.tags
}
