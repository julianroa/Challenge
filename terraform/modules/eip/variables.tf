variable "region" {
  description = "Value of the region for the instance"
  default     = "la-south-2"
  type        = string
}

variable "publicip_type" {
  description = "Type of the publicip"
  default     = "5_bgp"
  type        = string
}

variable "bandwidth_share_type" {
  description = "Share type"
  default     = "PER"
  type        = string
}

variable "bandwidth_size" {
    description = "Bandwidth size"
    type = number
}

variable "bandwidth_charge_mode" {
    description = "Bandwidth charge mode"
    default = "traffic"
    type = string
  
}

variable "bandwidth_name" {
  description = "value of the bandwidth name"
  default     = "bandwidth-apig"
  type        = string  
}