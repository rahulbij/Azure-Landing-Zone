# data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "example" {
    for_each = var.keyvault
  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = each.value.soft_delete_retention_days
  purge_protection_enabled    = false

  sku_name = each.value.sku_name

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
    ]

    secret_permissions = [
       "Set",
      "Get",
      "List",
      "Delete",
      "Purge",
      "Recover"

    ]

    storage_permissions = [
      "Get",
    ]
  }
  }

  #   resource "azurerm_role_assignment" "role" {
  # scope                = data.azurerm_subscription.primary.id
  # role_definition_name = "Key Vault Administrator"
  # principal_id         = data.azurerm_client_config.current.object_id
# }

resource "azurerm_key_vault_secret" "username" {
  depends_on = [ azurerm_key_vault.example ]
  for_each = var.keyvault
  name         = "username"
  value        = "admin01"
  key_vault_id = data.azurerm_key_vault_secrets.datakey[each.key].id
}
resource "azurerm_key_vault_secret" "password" {
  depends_on = [ azurerm_key_vault.example ]
  for_each = var.keyvault
  name         = "password"
  value        = "admin@123456"
  key_vault_id = data.azurerm_key_vault_secrets.datakey[each.key].id
}