module "fa_storage_account" {
  source = "../../../modules/storageaccount"

  sa_name      = "sadjbserviceappsdev"
  location     = var.location
  main_rg_name = var.main_rg_name
  environment  = var.environment
}
