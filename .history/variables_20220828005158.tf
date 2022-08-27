variable "resoure_group_name" {
  description = "Name of the resource group"
}

variable "location" {
  description = "Location of the resource"
}

variable "vm_name" {
  description = "VM Names"
  default = ["VM1","VM2","VM3"]
  type = set(string)
}