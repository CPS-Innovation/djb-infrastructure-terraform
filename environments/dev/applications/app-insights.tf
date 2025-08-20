module "app_insights" {
    source = "../../../modules/app-insights"

    environment = var.environment
    main_rg_name = module.rg.rg_name
    location = var.location
    tags = local.tags
}