provider "aws" {
    access_key = var.accessKey
    secret_key = var.secretKey
    region = var.region
}

module "instances" {
  source = "./instances"
  instanceNames = [ "julian.montoyag.api.terraform", "julian.montoyag.ui.terraform", "julian.montoyag.db.terraform" ]
}

module "elastic" {
  source = "./elastic"
  instanceId = module.instances.instancesIds[1].id
}