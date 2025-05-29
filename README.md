# Azure Kubernetes Service (AKS) Terraform Module

This Terraform module simplifies and automates the provisioning of an Azure Kubernetes Service (AKS) cluster. It enables infrastructure-as-code principles to set up a fully functional AKS cluster with modularity and reusability in mind.

## Module Structure 

``` 
aks-cluster/
├── main.tf         # AKS and supporting resources definition
├── variables.tf    # Input variables for module customization
├── outputs.tf      # Exported values post-deployment
└── versions.tf     # Terraform and provider version requirements
``` 

## Usage

```hcl
module "aks" {
  source              = "./aks-cluster"
  resource_group_name = "rg-dev-kadir"
  location            = "East US"
  aks_cluster_name    = "kadir-aks"
  dns_prefix          = "kadir"
  node_count          = 2
  vm_size             = "Standard_DS2_v2"
}
```

## Input Parameters

| Variable              | Type   | Description                            | Default             |
| --------------------- | ------ | -------------------------------------- | ------------------- |
| resource\_group\_name | string | Name of the Azure Resource Group       | (Required)          |
| location              | string | Azure region for resource deployment   | "East US"           |
| aks\_cluster\_name    | string | Name of the AKS Cluster                | (Required)          |
| dns\_prefix           | string | Prefix used for the AKS DNS entry      | "aks"               |
| node\_count           | number | Number of worker nodes in default pool | 2                   |
| vm\_size              | string | Size of VM instances in the node pool  | "Standard\_DS2\_v2" |

## Output Values 

| Output Name           | Description                                   |
| --------------------- | --------------------------------------------- |
| aks\_name             | Name of the deployed AKS cluster              |
| kube\_config          | Base64-encoded kubeconfig for CLI access      |
| node\_resource\_group | Name of the Azure-managed node resource group |



