module "dev-rg" {
  source       = "../../../modules/resource-group"
  location     = var.location
  main_rg_name = var.main_rg_name
}
