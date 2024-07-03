resource "azurerm_resource_group" "myrg" {
    for_each = var.rg
  name = each.value.resourse_group_name
  location = each.value.location
}