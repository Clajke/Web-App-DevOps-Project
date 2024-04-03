variable "client_id" {
  description = "The Client ID of the Azure service principal."
  type        = string
}

variable "client_secret" {
  description = "The Client Secret of the Azure service principal."
  type        = string
}

variable "tenant_id" {
  description = "The Tenant ID of your Azure Active Directory."
  type        = string
}

variable "subscription_id" {
  description = "The Subscription ID of your Azure subscription."
  type        = string
}


variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
}

variable "vnet_address_space" {
  type        = list(string)
  description = "The address space for the Virtual Network."
  default     = ["10.0.0.0/16"]
}

variable "cluster_name" {
  description = "The name of the AKS cluster."
  default     = "terraform-aks-cluster"
}

variable "dns_prefix" {
  description = "DNS prefix specified when creating the AKS cluster."
  default     = "myaks-project"
}

variable "kubernetes_version" {
  description = "The version of Kubernetes to use for the AKS cluster."
  default     = "1.26.6"
}

