module "aks" {
  source              = "../../modules/aks-cluster" 
  resource_group_name = "rg-dev-kadir" 
  location            = "East US"  
  aks_cluster_name    = "kadir-aks" 
  dns_prefix          = "kadir"  
  node_count          = 2  
  vm_size             = "Standard_DS2_v2" 
  subnet_id           = "/subscriptions/<subscription-id>/resourceGroups/rg-dev-kadir/providers/Microsoft.Network/virtualNetworks/vnet-dev/subnets/default" 
} 
 
