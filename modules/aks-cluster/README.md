# Azure Kubernetes Service (AKS) Terraform Module

This Terraform module simplifies and automates the provisioning of an Azure Kubernetes Service (AKS) cluster on Microsoft Azure. It is designed to follow Infrastructure-as-Code (IaC) principles, enabling easy, repeatable deployments in Azure.

## Key Features

- Deploys a production-grade AKS cluster in Microsoft Azure.
- Configures the default node pool with customizable node count and VM sizes.
- Utilizes system-assigned managed identities for secure access management.
- Supports Azure CNI for native networking in Azure virtual networks.
- Generates a base64-encoded kubeconfig file for direct access to the cluster.

## Module Structure

The module includes the following Terraform files:

```

aks-terraform-module/
├── modules/
│   └── aks-cluster/
│       ├── main.tf         # AKS and supporting resources definition
│       ├── variables.tf    # Module input variables
│       ├── outputs.tf      # Output values from deployment
│       ├── versions.tf     # Provider and Terraform version configuration
├── examples/
│   └── simple-aks-deployment/
│       └── main.tf         # Example usage of the AKS module
├── README.md              # Project documentation
└── LICENSE                 # Project license

````

## Requirements

Ensure the following tools are installed and configured:
- Terraform v1.3+
- Azure CLI
- Authenticated Azure session via `az login`

## Usage Example

1. Clone this repository and navigate to the example directory:
    ```bash
    git clone https://github.com/your-repo/aks-terraform-module.git
    cd aks-terraform-module/examples/simple-aks-deployment
    ```

2. Initialize the Terraform environment:
    ```bash
    terraform init
    ```

3. Review the Terraform execution plan:
    ```bash
    terraform plan
    ```

4. Apply the Terraform configuration to create the AKS cluster:
    ```bash
    terraform apply
    ```

5. After the deployment, retrieve the kubeconfig file:
    ```bash
    terraform output -raw kube_config > ~/.kube/aks-config
    export KUBECONFIG=~/.kube/aks-config
    kubectl get nodes
    ```

## Input Variables

| Variable             | Type    | Description                              | Default         |
|----------------------|---------|------------------------------------------|-----------------|
| resource_group_name  | string  | Name of the Azure Resource Group         | (Required)      |
| location             | string  | Azure region for resource deployment     | "East US"       |
| aks_cluster_name     | string  | Name of the AKS Cluster                  | (Required)      |
| dns_prefix           | string  | Prefix for the AKS DNS entry             | "aks"           |
| node_count           | number  | Number of nodes in the default node pool | 2               |
| vm_size              | string  | Size of the VMs in the node pool         | "Standard_DS2_v2" |
| subnet_id            | string  | Subnet ID for the AKS nodes              | (Required)      |

## Output Values

| Output Name          | Description                              |
|----------------------|------------------------------------------|
| aks_name             | Name of the deployed AKS cluster         |
| kube_config          | Base64-encoded kubeconfig for CLI access |
| node_resource_group  | Name of the Azure-managed node resource group |

## Extending the Module

You can further extend the AKS module to meet specific requirements:
- Integrate with Azure Key Vault for secret management.
- Enable private AKS clusters for enhanced security.
- Add multiple node pools for workload segregation.
- Implement Helm charts for deploying applications like NGINX or Traefik.
- Integrate with Azure Monitor or Container Insights for enhanced logging and monitoring.

## Friendly Note

I hope this AKS Terraform module helps streamline your infrastructure management in Azure! If you have any questions, need assistance, or want to contribute, feel free to open an issue or a pull request.
