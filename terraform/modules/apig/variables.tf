variable "region" {
  description = "Value of the region for the ECS instance"
  default     = "la-south-2"
  type        = string
}

variable "instance_name" {
  description = "Value of the instance name"
  default     = "apig-default"
  type        = string
}

variable "apig_secgroupid" {
  description = "Security group ID for the APIG"
  type        = string
}


variable "apig_region" {
  description = "Region where the APIG will be created"
  default = "la-south-2"
  type        = string
}

variable "secgroup_name" {
  description = "Name of the security group for the APIG"
  default = "default"
  type        = string
}




variable "apig_edition" {
  description = "Edition of the APIG"
  default = "BASIC"
  type        = string
}
  
variable "apig_vpcid" {
  description = "VPC ID where the APIG will be created"
  type        = string
}
  
variable "apig_subnetid" {
  description = "Subnet ID where the APIG will be created"
  type        = string
}
  
variable "api_description" {
  description = "Description of the APIG"
  default = "Created by tf"
  type        = string
}
  
variable "apig_eipid" {
  description = "EIP ID for the APIG"
  type        = string
}

  
  
variable "apig_description" {
  description = "Description of the APIG"
  default = "Created by tf"
  type        = string
  
}
