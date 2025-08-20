resource "azurerm_role_assignment" "sa" {
  for_each = toset(var.sa_roles)

  scope                = var.sa_id
  role_definition_name = each.value.role
  principal_id         = azurerm_linux_function_app.fa.id
}
