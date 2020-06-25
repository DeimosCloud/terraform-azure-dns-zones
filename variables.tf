variable "dns_zone_names" {
  description = "The public dns zone to be created for internal vnet resolution"
  default     = null
  type        = list(string)
}

variable "private_dns_zone_name" {
  description = "The private dns zone to be created for internal vnet resolution"
  default     = null
  type        = string
}

variable "private_dns_zone_vnet_links" {
  description = "Virtual networks to create Private DNS virtual network links. This enables DNS resolution and registration using Azure Private DNS"
  default     = []
  type        = list(string)
}

variable "resource_group_name" {
  description = "The name of the resource group where the Azure DNS resides"
  type        = string
}

variable "tags" {
  description = "Tags to be passed to created instances"
  default     = null
  type        = map(string)
}

variable "private_registration_enabled" {
  description = "Is auto-registration of virtual machine records in the virtual network in the Private DNS zone enabled?"
  default     = true
  type        = bool
}
