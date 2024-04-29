module "vpc" {
  source   = "./modules/vpc"
}

module "eks" {
  source   = "./modules/eks"
  earth_vpc_id = module.vpc.earth_vpc_id
  earth_subnet1_id = module.vpc.earth_subnet1_id
  earth_subnet2_id = module.vpc.earth_subnet2_id
}

