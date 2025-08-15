module "app_service_plan" {
  source = "../../../modules/app-service-plan"

  location     = var.location
  asp_name     = var.asp_name
  main_rg_name = var.main_rg_name
}
