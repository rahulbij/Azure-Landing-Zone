resource "azurerm_network_interface" "NIC" {
  for_each = var.NIC
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.ipconfig
    subnet_id                     = data.azurerm_subnet.datasubnet[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}