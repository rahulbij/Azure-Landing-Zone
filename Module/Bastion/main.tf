resource "azurerm_public_ip" "Pub01" {
    for_each = var.bastion
  name                = each.value.publicip
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
}

resource "azurerm_bastion_host" "bastion" {
    depends_on = [ azurerm_public_ip.Pub01 ]
    for_each = var.bastion
  name                = each.value.bastionname
    location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.subnet[each.key].id
    public_ip_address_id = azurerm_public_ip.Pub01[each.key].id
  }
}