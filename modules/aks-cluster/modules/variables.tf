variable "resource_group_name" {
  description = "The name of the Azure Resource Group."
  type        = string
}

variable "location" {
  description = "The Azure region in which to deploy the AKS cluster."
  type        = string
  default     = "East US"
}

variable "aks_cluster_name" {
  description = "The name of the AKS cluster."
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster."
  type        = string
  default     = "aks"
}

variable "node_count" {
  description = "The number of nodes in the default node pool."
  type        = number
  default     = 2
}

variable "vm_size" {
  description = "The size of VMs in the default node pool."
  type        = string
  default     = "Standard_DS2_v2"
}

variable "subnet_id" {
  description = "The ID of the subnet for the AKS nodes."
  type        = string
}
