data "azurerm_network_interface" "nic1" {
  for_each            = var.lb
  name                = each.value.nic1
  resource_group_name = each.value.resource_group_name
}

data "azurerm_network_interface" "nic2" {
  for_each            = var.lb
  name                = each.value.nic2
  resource_group_name = each.value.resource_group_name
}

