######################  /*subnet*/  ######################
vnet_rg   = "rg-djb-preprod"
vnet_name = "vn-djb-preprod" #created by the architet team

subnets = {
  subnet-djb-service-dev = {
    address_prefixes   = ["10.7.254.96/27"]
    service_endpoints  = ["Microsoft.Storage", "Microsoft.KeyVault"]
    service_delegation = false
  }
  subnet-djb-service-apps-dev = {
    address_prefixes   = ["10.7.254.192/27"]
    service_endpoints  = ["Microsoft.Storage", "Microsoft.KeyVault"]
    service_delegation = true
  }
}

######################  /*nsg*/ ######################
nsg_name                = "djb-nsg"
location                = "UKSouth"
environment             = "dev"
main_rg_name            = "rg-djb-dev"
security_rule_name      = "AllowAmzWorkspcCustom443Inbound"
security_rule_priority  = 100
security_rule_protocol  = "Tcp"
security_rule_direction = "Inbound"
