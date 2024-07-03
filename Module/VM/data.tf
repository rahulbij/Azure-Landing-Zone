data "azurerm_network_interface" "dataNic" {
    for_each = var.VM
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_client_config" "current" {}

data "azurerm_key_vault" "keyvault" {
  name = "alzrakeyvault19123456"
  resource_group_name = "ALZ"
  
}

data "azurerm_key_vault_secret" "username" {
  name = "username"
  key_vault_id = data.azurerm_key_vault.keyvault.id
  
}
data "azurerm_key_vault_secret" "password" {
  name = "password"
  key_vault_id = data.azurerm_key_vault.keyvault.id
  
}
