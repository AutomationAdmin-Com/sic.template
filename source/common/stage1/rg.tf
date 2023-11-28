
locals {
  tags = {
    AppEnv     = var.tags_app_env
    NW_Layer   = var.tags_nw_layer
    Apppoc     = var.tags_app_oc
    CC         = var.tags_cc
    Project    = var.tags_project
    EntAppname = var.tags_ent_app_name
    Pipeline   = var.pipeline
    Purpose    = "Testing Github Actions - ${var.requested_for}"
  }
}

module "rg" {
  source              = "git@github.com:AutomationAdmin-Com/module.rg.git?ref=v0.0.1"
  resource_group_name = "aa-${var.env_stage_abbr}-${var.region_abbr}-${var.sub_abbr}-${var.stage}-ga-rg"
  location            = var.region
  tags                = local.tags
}

module "rg_2" {
  source              = "git@github.com:AutomationAdmin-Com/module.rg.git?ref=feature"
  resource_group_name = "aa-${var.env_stage_abbr}-${var.region_abbr}-${var.sub_abbr}-${var.stage}-ga-rg"
  location            = var.region
  tags                = local.tags
}

module "rg_3" {
  source              = "git@github.com:AutomationAdmin-Com/module.rg.git?ref=main"
  resource_group_name = "aa-${var.env_stage_abbr}-${var.region_abbr}-${var.sub_abbr}-${var.stage}-ga-rg"
  location            = var.region
  tags                = local.tags
}
module "rand" {
  source              = "./modules/rand"
  resource_group_name = module.rg.name
}