resource "azurerm_role_assignment" "sa" {
  for_each = var.sa_roles

  scope                = var.sa_id
  role_definition_name = each.value
  principal_id         = azurerm_linux_function_app.fa.identity[0].principal_id
}
