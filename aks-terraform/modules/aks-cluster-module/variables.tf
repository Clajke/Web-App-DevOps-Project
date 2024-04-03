# AKS Cluster Name
variable "aks_cluster_name" {
  type        = string
  description = "The name of the AKS cluster to be created."
}

# Cluster Location
variable "cluster_location" {
  type        = string
  description = "The Azure region where the AKS cluster will be deployed."
}

# DNS Prefix
variable "dns_prefix" {
  type        = string
  description = "The DNS prefix for the AKS cluster."
}

# Kubernetes Version
variable "kubernetes_version" {
  type        = string
  description = "The version of Kubernetes to use for the AKS cluster."
}

# Service Principal Client ID
variable "service_principal_client_id" {
  type        = string
  description = "The Client ID for the service principal associated with the AKS cluster."
}

# Service Principal Secret
variable "service_principal_secret" {
  type        = string
  description = "The Client Secret for the service principal."
}

# Networking Module Outputs as Input Variables

# Resource Group Name
variable "resource_group_name" {
  type        = string
  description = "The name of the Azure Resource Group used for networking resources."
}

# Virtual Network ID
variable "vnet_id" {
  type        = string
  description = "The ID of the Virtual Network to which the AKS cluster will be connected."
}

# Control Plane Subnet ID
variable "control_plane_subnet_id" {
  type        = string
  description = "The ID of the subnet for the control plane components within the VNet."
}

# Worker Node Subnet ID
variable "worker_node_subnet_id" {
  type        = string
  description = "The ID of the subnet for the worker nodes within the VNet."
}

variable "aks_nsg_id" {
  type        = string
  description = "The ID of the security group"

}