resource "azurerm_kubernetes_cluster" "aks" {  
  name                = var.aks_cluster_name 
  location            = var.location  
  resource_group_name = var.resource_group_name 
  dns_prefix          = var.dns_prefix  
  kubernetes_version  = "1.21.2" 
  enable_rbac         = true 

  default_node_pool { 
    name       = "default"
    node_count = var.node_count
    vm_size    = var.vm_size  
    os_type    = "Linux" 
    vnet_subnet_id = var.subnet_id 
  } 
 
  identity { 
    type = "SystemAssigned" 
  }
 
  network_profile { 
    network_plugin = "azure"
  }
}
