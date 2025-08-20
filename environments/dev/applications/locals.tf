locals {
  tags = {
    environment = var.environment
  }
  pe_subnet_id = data.azurerm_subnet.base["subnet-djb-service-${var.environment}"].id
}
