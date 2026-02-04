module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  tags                 = merge({ Name = "${var.environment}-vpc" , Environment = var.environment }, var.tags)
}

module "key_pair" {
  source          = "./modules/key_pair"
  key_name        = var.key_name
  public_key      = var.public_key_path != "" ? file(var.public_key_path) : ""
}

module "security_group" {
  source          = "./modules/security_group"
  vpc_id          = module.vpc.vpc_id
  allowed_ssh_cidr = var.allowed_ssh_cidr
  tags            = merge({ Name = "${var.environment}-sg", Environment = var.environment }, var.tags)
}

module "instance" {
  source            = "./modules/instance"
  subnet_id         = module.vpc.public_subnet_ids[0]
  security_group_ids = [module.security_group.sg_id]
  instance_type     = var.instance_type
  key_name          = module.key_pair.key_name
  ami_id            = var.ami_id
  tags              = merge({ Name = "${var.environment}-ec2", Environment = var.environment }, var.tags)
}
