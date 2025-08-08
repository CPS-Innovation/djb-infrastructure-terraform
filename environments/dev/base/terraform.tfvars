vnet_rg   = "rg-djb-preprod"
location  = "UK South"
vnet_name = "vn-djb-preprod"
main_rg   = "rg-djb-devops-dev"

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
