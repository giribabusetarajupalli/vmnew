variable "rg_name" {
    type = string
    
}
variable "rg_location" {
    type = string
    
}

variable "vnet_name" {
    type = string
    
}

variable "subnet_name" {
    type = string
    
}

variable "vnet_address_space" {
    type = list(string)
    
}

variable "subnet_address_space" {
    type = list(string)
    
}

variable "nic_name" {
    type = string
    
}
variable "pip_name" {
    type = string
    
}
variable "NSG_name" {
    type = string
    
}
variable "vm_name" {
    type = string
    
}

variable "vm_size" {
    type = string
    
}