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

variable "fgs_urn" {
  description = "Value of the FGS function URN"
  type        = string
}

variable "trigger_apig_type" {
  description = "Type of the APIG used as trigger"
  default     = "DEDICATEDGATEWAY"
  type        = string
}

variable "trigger_status" {
  description = "Status of the trigger"
  default     = "ACTIVE"
  type        = string
}

variable "apig_instanceid" {
  description = "The instance ID for the API Gateway"
  type        = string
}

variable "apig_groupid" {
  description = "The group ID for the API Gateway"
  type        = string
}

variable "api_name" {
  description = "Name of the API"
  type        = string
}

variable "env_name" {
  description = "Environment name"
  default = "RELEASE"
  type        = string
}

variable "request_protocol" {
  description = "Request protocol for the API"
  default = "NONE"
  type        = string
}

variable "security_authentication" {
  description = "Security authentication method"
  default = "NONE"
  type        = string
}

variable "timeout" {
  description = "Timeout value"
  type        = number
}
