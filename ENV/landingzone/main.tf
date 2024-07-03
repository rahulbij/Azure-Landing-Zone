module "rg" {
  source = "../../Module/Resoursegroup"
  rg     = var.rg
}

module "Vnet" {
  depends_on = [module.rg, module.keyvault]
  source     = "../../Module/Vnet"
  Vnet       = var.Vnet
}
module "subnet" {
  depends_on = [module.Vnet]
  source     = "../../Module/subnet"
  subnet     = var.subnet
}
module "nsg" {
  depends_on = [module.subnet]
  source     = "../../Module/NSG"
  nsg        = var.nsg
}

module "nic" {
  depends_on = [module.subnet]
  source     = "../../Module/NIC"
  NIC        = var.NIC
}
module "VM" {
  depends_on = [module.nic, module.keyvault]
  source     = "../../Module/VM"
  VM         = var.VM
}

module "keyvault" {
  depends_on = [module.rg]
  source     = "../../Module/keyvault"
  keyvault   = var.keyvault
}

module "LB" {
  depends_on = [module.nic, module.VM]
  source     = "../../Module/load balancer"
  lb         = var.lb
}

module "bastion" {
  depends_on = [module.nic, module.VM]
  source     = "../../Module/Bastion"
  bastion =     var.bastion
}
