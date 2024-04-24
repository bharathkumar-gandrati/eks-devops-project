module "vpc" {
  source   = "./modules/vpc"
  
  
}

module "ec2" {
  source   = "./modules/ec2"

  valaxy_vpc_id = module.vpc.valaxy_vpc_id
  valaxy_subnet1_id = module.vpc.valaxy_subnet1_id
}
