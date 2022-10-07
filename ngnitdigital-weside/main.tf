# configure aws provider
provider "aws" {
  region    = var.region
  profile   = "Mj-user1"
}

# create vpc (let refference the vpc module) tuto = https://www.youtube.com/watch?v=oohXRXjahFA
module "vpc" {
  source                        = "../modules/VPC"
  region                        = var.region
project_name                    = var.project_name
vpc_cidr                        = var.vpc_cidr
public_subnet_az1_cidr          = var.public_subnet_az1_cidr
public_subnet_az2_cidr          = var.public_subnet_az2_cidr
private_app_subnet_az1_cidr     = var.private_app_subnet_az1_cidr
private_app_subnet_az2_cidr     = var.private_app_subnet_az2_cidr
private_data_subnet_az1_cidr    = var.private_data_subnet_az1_cidr
private_data_subnet_az2_cidr    = var.private_data_subnet_az2_cidr
}

# create nat-gateway (call the module) then the variable you just created, refference it as agument here
module "nate_gateway" {
source                      = "../modules/nat-gateway"
public_subnet_az1_id        = module.vpc.public_subnet_az1_id
internet_gateway            = module.vpc.internet_gateway
public_subnet_az2_id        = module.vpc.public_subnet_az2_id
vpc_id                      = module.vpc.vpc_id
private_app_subnet_az1_id   = module.vpc.private_app_subnet_az1_id
private_data_subnet_az1_id  = module.vpc.private_data_subnet_az1_id
private_app_subnet_az2_id   = module.vpc.private_app_subnet_az2_id
private_data_subnet_az2_id  = module.vpc.private_data_subnet_az2_id
}

# create a module to refference our security group. 
module "security_group" {
  source = "../modules/security-groups" # here 2 .. is to ask terraform to go up 2 directory. 
  vpc_id = module.vpc.vpc_id
}