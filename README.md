# azure-dns-zones

A terraform module for managing Private and Public DNS zones on Azure## Requirements

```hcl
module "dns_zone" {
  source                      = "../modules/dns_zone"
  resource_group_name         = azurerm_resource_group.resource_group.name
  dns_zone_names              = [var.dns_zone_name]
  private_dns_zone_name       = var.private_dns_zone_name
  private_dns_zone_vnet_links = [var.vnet_id]
}
```

## Requirements
| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| azurerm | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | >= 2.0 |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| dns\_zone\_names | The public dns zone to be created for internal vnet resolution | `list(string)` | `null` | no |
| private\_dns\_zone\_name | The private dns zone to be created for internal vnet resolution | `string` | `null` | no |
| private\_dns\_zone\_vnet\_links | Virtual networks to create Private DNS virtual network links. This enables DNS resolution and registration using Azure Private DNS | `list(string)` | `[]` | no |
| private\_registration\_enabled | Is auto-registration of virtual machine records in the virtual network in the Private DNS zone enabled? | `bool` | `true` | no |
| resource\_group\_name | The name of the resource group where the Azure DNS resides | `string` | n/a | yes |
| tags | Tags to be passed to created instances | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| name\_servers | n/a |
| private\_dns\_zone\_name | n/a |
