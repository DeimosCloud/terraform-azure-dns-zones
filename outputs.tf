output "name_servers" {
  value = azurerm_dns_zone.dns_zone.*.name_servers
}

output "private_dns_zone_name" {
  value = azurerm_private_dns_zone.private_dns_zone.0.name

  depends_on = [azurerm_private_dns_zone.private_dns_zone]
}

#output "private_name_servers" {
#  value = azurerm_private_dns_zone.private_dns_zone.0.name_servers

#  depends_on = [azurerm_private_dns_zone.private_dns_zone]
#}
