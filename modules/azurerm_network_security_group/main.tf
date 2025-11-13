resource "azurerm_network_security_group" "azurerm_nsg" {
  for_each            = var.network_security_group
  name                = each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  tags                = each.value.tags

  dynamic "security_rule" {
    for_each = each.value.security_rules
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }
}


resource "azurerm_subnet_network_security_group_association" "subnet_associate" {
  for_each                  = var.network_security_group
  subnet_id                 = data.azurerm_subnet.subnet_id[each.key].id
  network_security_group_id = azurerm_network_security_group.azurerm_nsg[each.key].id
}
# resource "azurerm_network_interface_security_group_association" "nic_associate" {
#   for_each                  = var.network_security_group
#   network_interface_id      = data.azurerm_network_interface.nic_id[each.key].id
#   network_security_group_id = azurerm_network_security_group.azurerm_nsg[each.key].id
# }


data "azurerm_subnet" "subnet_id" {
  for_each             = var.network_security_group
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.rg_name
}

# data "azurerm_network_interface" "nic_id" {
#   for_each = var.network_security_group
#   name                = each.value.nic_name
#   resource_group_name = each.value.rg_name
# }

