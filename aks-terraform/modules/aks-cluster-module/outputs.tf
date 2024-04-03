# AKS Cluster Name
output "aks_cluster_name" {
  value       = azurerm_kubernetes_cluster.aks_cluster.name
  description = "The name of the provisioned AKS cluster."
}

# AKS Cluster ID
output "aks_cluster_id" {
  value       = azurerm_kubernetes_cluster.aks_cluster.id
  description = "The ID of the provisioned AKS cluster."
}

# AKS Kubeconfig
output "aks_kubeconfig" {
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  description = "The Kubernetes configuration file for the AKS cluster. Use this to interact with your AKS cluster using kubectl."
  sensitive   = true
}