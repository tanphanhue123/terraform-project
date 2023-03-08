locals {
  name = "terrafrom project"
}

provider "aws" {
    region = us-west-2
  
}

module "networking" {
  source = "./modules/networking"
}

module "database" {
  source = "./modules/database"
  project = local.name
  vpc = module.networking.vpc
  sg = module.networking.sg

module "autoscaling" {
  source = "./modules/autoscaling"
  project   = local.project
  vpc       = module.networking.vpc
  sg        = module.networking.sg
  db_config = module.database.config
}
}