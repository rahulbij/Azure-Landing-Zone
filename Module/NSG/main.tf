resource "azurerm_network_security_group" "NSG" {
  for_each = var.nsg
  name                = each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_subnet_network_security_group_association" "subnet_to_nsg" {
  for_each = var.nsg
  subnet_id                 = data.azurerm_subnet.datasubnet[each.key].id
  network_security_group_id = azurerm_network_security_group.NSG[each.key].id
}
