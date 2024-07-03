resource "azurerm_linux_virtual_machine" "vm" {
    for_each = var.VM
  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = data.azurerm_key_vault_secret.username.value
  admin_password = data.azurerm_key_vault_secret.password.value
  disable_password_authentication = "false"
  network_interface_ids = [
    data.azurerm_network_interface.dataNic[each.key].id,
  ]

#   admin_ssh_key {
#     username   = "adminuser"
#     public_key = file("~/.ssh/id_rsa.pub")
#   }

  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
  availability_set_id = null
}