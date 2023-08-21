


# `my_keypair` variable for specifying the Huawei Cloud keypair
variable "keypair_name" {
  description = "Name of your Huawei Cloud keypair"
  type        = string
  sensitive   = true  # The value of this variable is sensitive and should not be displayed in logs or outputs
}

# `vpc_name` variable for specifying the VPC name to be used in the AS group
variable "vpc_name" {
  description = "Value of the VPC name to be used in the AS group"
  default     = "vpc-default"
  type        = string
}

# `subnet_name` variable for specifying the subnet name to be used in the AS group
variable "subnet_name" {
  description = "Value of the subnet name to be used in the AS group"
  default     = "subnet-default"
  type        = string
}

variable "vpc_id" {
  description = "vpc id"
  type        = string  
}

variable "subnet_id" {
  description = "value of the subnet id"
  type = string
}


# `cce_name` variable for specifying the subnet name to be used in the AS group
variable "cce_name" {
  description = "Name of the CCE to be created"
  default     = "cce-default"
  type        = string
}

# `cce_name` variable for specifying the subnet name to be used in the AS group
variable "cce_node_name" {
  description = "Name of the CCE Node to be created"
  default     = "cce-default"
  type        = string
}

variable "cce_flavor_id" {
  description = "value of the flavor id"
  default     = "cce.s2.small"
  type        = string
  
}


variable "container_network_type" {
  description = "value of the container network type"
  default     = "overlay_l2"
  type        = string
  
}



variable "node_flavor_id" {
  description = "value of the node flavor id"
  default     = "c6s.xlarge.2"
  type        = string  
  
}

variable "root_volume_size" {
  description = "value of the root volume size"
  default     = 40
  type        = number
  
}
  
variable "root_volumetype" {
  description = "value of the root volume type"
  default     = "SAS"
  type        = string
  
  
}

variable "data_volume_size" {
  description = "value of the data volume size"
  default     = 100
  type        = number
  
}
  
variable "data_volumetype" {
  description = "value of the data volume type"
  default     = "SAS"
  type        = string
  
}

variable "node_eip_id" {
  description = "value of the eip id"
  type        = string
  
}

variable "keypair_file" {
  description = "location where the keypair file will be stored"
  default = null
  type        = string
  
  
}

variable "cluster_eip" {
  description = "value of the cluster eip"
  type        = string
  
}
  