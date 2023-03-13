module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.12.0"
  name = "$var.project - vpc"
  cidr = var.cidr_block

  private_subnets = var.private_subnets
  public_subnet = var.public_subnets
  database_subnet = var.database_subnets

  create_database_subnet_group  = true
  enable_nat_gateway            = true
  single_nat_gateway            = true
  enable_dns_hostnames          = true
  enable_dns_support            = true
  
}

module "alb_sg" {
  source = "terraform-in-action/sg/aws"
  vpc_id = module.vpc.vpc_id
  ingress_rules = [
    {
      port        = 80
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

}

module "web_sg" {
  source = "terraform-in-action/sg/aws"
  vpc_id = module.vpc.vpc_id
  ingress_rules =[
    {
      port        = 80
      security_groups = module.alb_sg.security_groups.id
    }
  ]

}

module "db_sg" {
  source = "terraform-in-action/sg/aws"
  vpc_id = module.vpc.vpc_id
  ingress_rules = [
    {
      port            = 5432
      security_groups = module.web_sg.security_group.id
    }
  ]

} 


