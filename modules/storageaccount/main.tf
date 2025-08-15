resource "azurerm_storage_account" "sa" {
  name                     = "sadjb${var.environment}"
  resource_group_name      = var.main_rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  is_hns_enabled           = true

  public_network_access_enabled = false

  tags = {
    environment = var.environment
  }
}

resource "azurerm_private_endpoint" "sa" {
  name                = "pe-djb-${var.environment}"
  location            = var.location
  resource_group_name = var.main_rg_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = azurerm_storage_account.sa.name
    private_connection_resource_id = azurerm_storage_account.sa.id
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
