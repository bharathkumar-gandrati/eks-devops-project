module "vpc" {
  source   = "./modules/vpc"
  
  
}

/*module "ec2" {
  source   = "./modules/ec2"

  earth_vpc_id = module.vpc.earth_vpc_id
  earth_subnet1_id = module.vpc.earth_subnet1_id
}*/


module "eks" {
  source   = "./modules/eks"

  earth_vpc_id = module.vpc.earth_vpc_id
  earth_subnet1_id = module.vpc.earth_subnet1_id
  earth_subnet2_id = module.vpc.earth_subnet2_id

}
