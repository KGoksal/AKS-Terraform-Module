output "aks_name" {
  description = "The name of the deployed AKS cluster."
  value       = azurerm_kubernetes_cluster.aks.name
}

output "kube_config" {
  description = "Base64-encoded kubeconfig for CLI access."
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
}

output "node_resource_group" {
  description = "The name of the Azure-managed node resource group."
  value       = azurerm_kubernetes_cluster.aks.node_resource_group_name
}
