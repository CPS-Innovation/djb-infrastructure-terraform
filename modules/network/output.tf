output "subnet_id" {
  value = {
    for k, v in azurerm_subnet.subnets :
    k => v.id
  }
}
