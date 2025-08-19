module "rg" {
  source       = "../../../modules/resource-group"

  location     = var.location
  main_rg_name = "rg-djb-${var.environment}"
  
  tags = local.tags
}
