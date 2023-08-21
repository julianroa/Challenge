variable "region" {
  description = "Value of the region for the ECS instance"
  default     = "la-south-2"
  type        = string
}

variable "apig_group_name" {
  description = "Name of the api group to be created in the APIG"
  default = "apigroup_default"
  type        = string
}

variable "apig_region" {
  description = "Region where the APIG will be created"
  default = "la-south-2"
  type        = string
}

variable "apig_instanceid" {
  description = "APIG instance id"
  type        = string
}
