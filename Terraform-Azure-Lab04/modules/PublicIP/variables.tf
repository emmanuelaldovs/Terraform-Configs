variable "name" {
    type = string
    description = "The base of the name for the resource and storage account"
}

variable "location" {
    type = string
    description = "The location for the deployment"  
}

variable "resource_group_name"{
    type = string
    description = "Data Lake Gen2 name"
}

variable "allocation_method" {
    type = string
    description = "Method IP Static or Dynamic"  
}