module "vpc" {
  source   = "./modules/vpc"
  app_name = var.app_name
  vpc_cidr = var.vpc_cidr
  region   = var.region
}

module "ecr" {
  source   = "./modules/ecr"
  app_name = var.app_name
}

module "acm" {
  source        = "./modules/acm"
  app_subdomain = var.app_subdomain
  domain_name   = var.domain_name
}

module "alb" {
  source                = "./modules/alb"
  app_name              = var.app_name
  vpc_id                = module.vpc.vpc_id
  public_subnet_1_id    = module.vpc.public_subnet_1_id
  public_subnet_2_id    = module.vpc.public_subnet_2_id
  alb_security_group_id = module.vpc.alb_security_group_id
  certificate_arn       = module.acm.certificate_arn
  container_port        = var.container_port
}

module "ecs" {
  source                = "./modules/ecs"
  app_name              = var.app_name
  region                = var.region
  vpc_id                = module.vpc.vpc_id
  public_subnet_1_id    = module.vpc.public_subnet_1_id
  public_subnet_2_id    = module.vpc.public_subnet_2_id
  ecs_security_group_id = module.vpc.ecs_security_group_id
  target_group_arn      = module.alb.target_group_arn
  image_url             = var.image_url
  container_port        = var.container_port
  desired_count         = var.desired_count
}