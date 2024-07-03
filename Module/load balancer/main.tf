resource "azurerm_public_ip" "Public_ip" {
  for_each            = var.lb
  name                = each.value.PIP_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method
  sku = each.value.sku
}

resource "azurerm_lb" "lb1" {
  depends_on          = [azurerm_public_ip.Public_ip]
  for_each            = var.lb
  name                = each.value.Lb_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku = each.value.sku_type

  frontend_ip_configuration {
    name                 = each.value.frontend_ip_configuration
    public_ip_address_id = azurerm_public_ip.Public_ip[each.key].id
  }
}

resource "azurerm_lb_backend_address_pool" "pool_backend" {
  for_each = var.lb
  depends_on      = [azurerm_lb.lb1]
  loadbalancer_id = azurerm_lb.lb1[each.key].id
  name            = each.value.backendpool
}

resource "azurerm_network_interface_backend_address_pool_association" "association1" {
  depends_on              = [azurerm_lb_backend_address_pool.pool_backend]
  for_each                = var.lb
  network_interface_id    = data.azurerm_network_interface.nic1[each.key].id
  ip_configuration_name   = each.value.ip_configuration_frontend
  backend_address_pool_id = azurerm_lb_backend_address_pool.pool_backend[each.key].id
}
resource "azurerm_network_interface_backend_address_pool_association" "association2" {
  depends_on              = [azurerm_lb_backend_address_pool.pool_backend]
  for_each                = var.lb
  network_interface_id    = data.azurerm_network_interface.nic2[each.key].id
  ip_configuration_name   = each.value.ip_configuration_backend
  backend_address_pool_id = azurerm_lb_backend_address_pool.pool_backend[each.key].id
}


resource "azurerm_lb_probe" "lb_probe1" {
  depends_on      = [azurerm_network_interface_backend_address_pool_association.association1, azurerm_network_interface_backend_address_pool_association.association2, azurerm_lb_backend_address_pool.pool_backend]
  for_each        = var.lb
  loadbalancer_id = azurerm_lb.lb1[each.key].id
  name            = each.value.probe_name
  port            = 22
}

resource "azurerm_lb_rule" "mylbrule1" {
  depends_on                     = [azurerm_lb_probe.lb_probe1]
  for_each                       = var.lb
  loadbalancer_id                = azurerm_lb.lb1[each.key].id
  name                           = each.value.lb_rule_name
  protocol                       = each.value.protocol
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = each.value.frontend_ip_configuration

}