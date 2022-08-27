variable "resoure_group_name" {
  description = "Name of the resource group"
}

variable "location" {
  description = "Location of the resource"
  default     = "West Europe"
}

variable "application_name" {
  description = "Name of the application"
}

variable "ip-name" {
  description = "Name of the public ip"
}

variable "imageversion" {
 description ="Tag of the image to deploy"
 default = "v1"
}

variable "dockerhub-username" {
  description ="Dockerhub Username"
  default = "ducle111"
}