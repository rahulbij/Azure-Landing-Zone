

data "azurerm_client_config" "current" {}
# data "azurerm_subscription" "primary" {}
  

# data "azurerm_key_vault" "example" {
#    depends_on = [ azurerm_key_vault.example ] 
# resource_group_name = "ALZ"
# name = "alzrakeyvault19912"

# }

data "azurerm_key_vault_secrets" "datakey" {
    for_each = var.keyvault
key_vault_id = azurerm_key_vault.example[each.key].id
}
