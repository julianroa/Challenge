variable "region" {
  description = "Value of the region for the ECS instance"
  default     = "la-south-2"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  default = "vpc-apig"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default = "172.16.0.0/12"
  type        = string
}

variable "subnet_name" {
  description = "Name of the Subnet"
  default = "subnet-apig"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block for the Subnet"
  default = "172.16.0.0/24"
  type        = string
}

variable "subnet_gateway_ip" {
  description = "Gateway IP for the Subnet"
  default = "172.16.0.1"
  type        = string
}

variable "primary_dns" {
  description = "Primary dns"
  default = null
  type        = string
  
}

variable "secondary_dns" {
  description = "Primary dns"
  default = null
  type        = string
  
}

