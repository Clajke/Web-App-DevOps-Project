# VNet ID
output "vnet_id" {
  value       = azurerm_virtual_network.aks_vnet.id
  description = "The ID of the Virtual Network (VNet) created for AKS."
}

# Control Plane Subnet ID
output "control_plane_subnet_id" {
  value       = azurerm_subnet.control_plane_subnet.id
  description = "The ID of the subnet within the VNet for the control plane components of the AKS cluster."
}

# Worker Node Subnet ID
output "worker_node_subnet_id" {
  value       = azurerm_subnet.worker_node_subnet.id
  description = "The ID of the subnet within the VNet for the worker nodes of the AKS cluster."
}

# Networking Resource Group Name
output "resource_group_name" {
  value       = azurerm_resource_group.aks_rg.name
  description = "The name of the Azure Resource Group where the networking resources were provisioned."
}

# AKS NSG ID
output "aks_nsg_id" {
  value       = azurerm_network_security_group.aks_nsg.id
  description = "The ID of the Network Security Group (NSG) associated with the AKS cluster."
}