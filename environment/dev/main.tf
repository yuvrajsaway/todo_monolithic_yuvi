
module "resource_group" {
  source         = "../../modules/azurerm_resource_group"
  resource_group = var.resource_group
}

module "network_security_group" {
  depends_on = [ module.virtual_network, module.network_interface, module.resource_group ]
  source                 = "../../modules/azurerm_network_security_group"
  network_security_group = var.network_security_group

}


module "virtual_network" {
  depends_on = [ module.resource_group ]
  source          = "../../modules/azurerm_virtual_network"
  virtual_network = var.virtual_network
}

module "network_interface" {
  depends_on = [ module.virtual_network, module.resource_group ]
  source = "../../modules/azurerm_network_interface"
  nic = var.nic
  
}

module "linux_virtual_machine" {
  depends_on = [ module.resource_group, module.network_interface ]
  source                = "../../modules/azurerm_linux_virtual_machine"
  linux_virtual_machine = var.linux_virtual_machine
  

}

