module "app_service_plan" {
  source = "../../../modules/app-service-plan"

  location     = var.location
  asp_name     = "asp-djb-${var.environment}"
  main_rg_name = module.rg.rg_name
  tags         = local.tags
}
