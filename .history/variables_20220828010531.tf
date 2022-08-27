variable "resoure_group_name" {
  description = "Name of the resource group"
}

variable "location" {
  description = "Location of the resource"
}

variable "number_VM" {
  type = number
  default = 1
  description = "Number of VM to create"
}