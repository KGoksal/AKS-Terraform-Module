# Azure Kubernetes Service (AKS) Terraform Module

This Terraform module simplifies and automates the provisioning of an Azure Kubernetes Service (AKS) cluster. It enables infrastructure-as-code principles to set up a fully functional AKS cluster with modularity and reusability in mind. 

### Directory Structure 

```
aks-terraform-module/
├── modules/  
│   └── aks-cluster/ 
│       ├── main.tf 
│       ├── variables.tf  
│       ├── outputs.tf 
│       ├── versions.tf
├── examples/ 
│   └── simple-aks-deployment/ 
│       └── main.tf  
└── README.md
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

## Requirements

Ensure the following are installed and configured:

* Terraform v1.3+
* Azure CLI
* Authenticated Azure session via `az login`

 
## Quick Start

```bash
az login 
az account set --subscription "<your-subscription-id>"  
 
terraform init 
terraform plan 
terraform apply 
```

After provisioning, to connect using `kubectl`: 

```bash 
terraform output -raw kube_config > ~/.kube/aks-config 
export KUBECONFIG=~/.kube/aks-config 
kubectl get nodes
```



I hope this module helps you easily deploy and manage your AKS clusters in Azure! If you have any questions, feedback, or need further assistance, feel free to reach out. Happy coding and good luck with your cloud projects!  
