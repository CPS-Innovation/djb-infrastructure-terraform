module "fa_storage_account" {
  source = "../../../modules/storageaccount"

  location     = var.location
  main_rg_name = var.main_rg_name
  environment  = var.environment
}
