
resource "azurerm_private_endpoint" "sa" {
  name                = var.pe_sa_name
  location            = var.location
  resource_group_name = var.main_rg_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = var.storage_account_name
    private_connection_resource_id = var.storage_account_id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "sa-dns-zone-group"
    private_dns_zone_ids = [var.private_dns_zone_ids]
  }

  tags = {
    environment = var.environment
  }
}
