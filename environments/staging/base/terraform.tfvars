environment = "preprod"

######################  /*subnet*/  ######################
vnet_rg     = "rg-djb-preprod"
vnet_name   = "vn-djb-preprod" #created by the architet team
rt_djb_name = "RT-djb-preprod"

subnets = {
  subnet-djb-service-dev = {
    address_prefixes   = ["10.7.254.0/27"]
    service_endpoints  = ["Microsoft.Storage", "Microsoft.KeyVault"]
    service_delegation = false
  }
  subnet-djb-service-apps-dev = {
    address_prefixes   = ["10.7.254.32/27"]
    service_endpoints  = ["Microsoft.Storage", "Microsoft.KeyVault"]
    service_delegation = true
  }
}

######################  /*nsg*/ ######################
nsg_name = "nsg-djb-preprod"
location = "UKSouth"
