variable "base_name" {
    type = string
    description = "The base of the name for the resource and storage account"
}

variable "resource_group_name" {
    type = string
    description = "Name of the resource group"
  
}

variable "location" {
    type = string
    description = "The location for the deployment"  
}

variable "dlgen2_name"{
    type = string
    description = "Data Lake Gen2 name"
}