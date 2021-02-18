resource "random_id" "this" {
  byte_length = "8"
}

resource "azurerm_dns_zone" "dns_zone" {
  count               = length(var.dns_zone_names)
  name                = (var.dns_zone_names)[count.index]
  resource_group_name = data.azurerm_resource_group.dns_zone.name
}

resource "azurerm_private_dns_zone" "private_dns_zone" {
  count               = var.private_dns_zone_name == null ? 0 : 1
  name                = var.private_dns_zone_name
  resource_group_name = data.azurerm_resource_group.dns_zone.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "private_dns_vnet_link" {
  count                 = length(var.private_dns_zone_vnet_links)
  name                  = "vnet-link-${random_id.this.hex}"
  resource_group_name   = data.azurerm_resource_group.dns_zone.name
  private_dns_zone_name = azurerm_private_dns_zone.private_dns_zone.0.name
  registration_enabled  = var.private_registration_enabled
  virtual_network_id    = var.private_dns_zone_vnet_links[count.index]

  tags = var.tags
}
