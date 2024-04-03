variable "resource_group_name" {
  type        = string
  description = "The name of the Azure Resource Group where the networking resources will be deployed."
  default     = "myResourceGroup"
}

variable "location" {
  type        = string
  description = "The Azure region where the networking resources will be deployed."
  default     = "UK South"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "The address space for the Virtual Network (VNet)."
  default     = ["10.0.0.0/16"]
}