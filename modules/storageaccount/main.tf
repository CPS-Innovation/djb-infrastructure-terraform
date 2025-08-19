resource "azurerm_storage_account" "sa" {
  name                     = var.sa_name
  resource_group_name      = var.main_rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  is_hns_enabled           = true

  public_network_access_enabled = false

  tags = var.tags
}
