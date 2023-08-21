variable "region" {
  description = "Value of the region for the provider"
  default     = "la-south-2"
  type        = string
}

variable "fg-region" {
  description = "Value of the region for the FGS function"
  default     = "la-south-2"
  type        = string
}

variable "fg-domain" {
  description = "Value for the FGS domain"
  default = "myhuaweicloud.com"
  type        = string
}

variable "fg-projectId" {
  description = "Value of the project id"
  type        = string
}

variable "fgs_function_name" {
  description = "Name of the FGS function"
  type        = string
}

variable "fgs_app" {
  description = "Application of the FGS function"
  type        = string
}

variable "fgs_agency" {
  description = "Agency of the FGS function"
  type        = string
}

variable "fgs_handle" {
  description = "Handler of the FGS function"
  type        = string
}

variable "fgs_memory" {
  description = "Memory size of the FGS function"
  type        = number
}

variable "fgs_timeout" {
  description = "Timeout of the FGS function"
  type        = number
}

variable "runtime" {
  description = "Runtime of the FGS function"
  type        = string
}

variable "code_url" {
  description = "URL of the code package"
  type        = string
}

variable "dependency_name" {
  description = "Name of the FGS function dependency"
  type        = string
}

variable "dependencies_type" {
  description = "Type of the FGS function dependencies"
  type        = string
}

variable "whiteLists" {
  description = "Name of the ECS to be whitelisted"
  type        = string
  
}