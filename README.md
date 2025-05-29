# Azure Kubernetes Service (AKS) Terraform Module

This Terraform module simplifies and automates the provisioning of an Azure Kubernetes Service (AKS) cluster. It enables infrastructure-as-code principles to set up a fully functional AKS cluster with modularity and reusability in mind.

## Module Structure

```
aks-cluster/
├── main.tf         # AKS and supporting resources definition
├── variables.tf    # Input variables for module customization
├── outputs.tf      # Exported values post-deployment
└── versions.tf     # Terraform and provider version requirements
