variable "name" {
    type = string
    description = "The base of the name for the resource and storage account"
}

variable "address_space" {
    type = list(string)
    description = "Address space"
  
}

variable "location" {
    type = string
    description = "The location for the deployment"  
}

variable "resource_group_name"{
    type = string
    description = "Data Lake Gen2 name"
}

variable "virtual_network_name"{
    type = string
    description = "Name Virtual Network"
}