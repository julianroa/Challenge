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

variable "fgs_start_function_name" {
  description = "Name of the FGS start function"
  type        = string
}

variable "fgs_stop_function_name" {
  description = "Name of the FGS stop function"
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

variable "fgs_start_code_url" {
  description = "URL of the code package"
  type        = string
}

variable "fgs_stop_code_url" {
  description = "URL of the code package"
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



variable "start_api_name" {
  description = "Name of the API"
  type        = string
}

variable "stop_api_name" {
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
  type        = string
}

variable "security_authentication" {
  description = "Security authentication method"
  type        = string
}

variable "timeout" {
  description = "Timeout value"
  type        = number
}

variable "dependency_name" {
  description = "Name of the FGS function dependency"
  type        = string
}

variable "dependencies_type" {
  description = "Type of the FGS function dependencies"
  type        = string
}



variable "vpc_cce_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cce_cidr" {
  description = "CIDR block for the VPC"
  default = "192.168.0.0/16"
  type        = string
}

variable "subnet_cce_name" {
  description = "Name of the Subnet"
  type        = string
}

variable "subnet_cce_cidr" {
  description = "CIDR block for the Subnet"
  default = "192.168.0.0/24"
  type        = string
}

variable "subnet_cce_gateway_ip" {
  description = "Gateway IP for the Subnet"
  default = "192.168.0.1"
  type        = string
}

variable "primary_cce_dns" {
  description = "Primary dns"
  default = "100.125.1.250"
  type        = string
  
}

variable "secondary_cce_dns" {
  description = "Primary dns"
  default = "100.125.21.250"
  type        = string
  
}

variable "apig_edition" {
  description = "Edition of the APIG"
  default = "BASIC"
  type        = string
}

variable "instance_name" {
  description = "Value of the instance name"
  default     = "apig-default"
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

variable "bandwidth_apig_name" {
  description = "Name of the bandwidth for the APIG"
  default = "bandwidth-apig"
  type        = string
}

variable "bandwidth_cce_node_name" {
  description = "Name of the bandwidth for the CCE"
  default = "bandwidth-cce-node"
  type        = string
}

variable "bandwidth_cce_cluster_name" {
  description = "Name of the bandwidth for the CCE"
  default = "bandwidth-cce-node"
  type        = string
}

variable "apig_group_name" {
  description = "Name of the api group to be created in the APIG"
  default = "apigroup_default"
  type        = string
}


variable "api_description" {
  description = "Description of the APIG"
  default = "Created by tf"
  type        = string
}
  
  

variable "apig_description" {
  description = "Description of the APIG"
  default = "Created by tf"
  type        = string
  
}

variable "publicip_apig_type" {
  description = "Type of the publicip"
  default     = "5_bgp"
  type        = string
}

variable "publicip_cce_node_type" {
  description = "Type of the publicip"
  default     = "5_bgp"
  type        = string
}

variable "publicip_cce_cluster_type" {
  description = "Type of the publicip"
  default     = "5_bgp"
  type        = string
}

variable "bandwidth_apig_share_type" {
  description = "Share type"
  default     = "PER"
  type        = string
}

variable "bandwidth_cce_node_share_type" {
  description = "Share type"
  default     = "PER"
  type        = string
}

variable "bandwidth_cce_cluster_share_type" {
  description = "Share type"
  default     = "PER"
  type        = string
}

variable "bandwidth_apig_size" {
    description = "Bandwidth size"
    type = number
}

variable "bandwidth_cce_node_size" {
    description = "Bandwidth size"
    type = number
}

variable "bandwidth_cce_cluster_size" {
    description = "Bandwidth size"
    type = number
}

variable "bandwidth_apig_charge_mode" {
    description = "Bandwidth charge mode"
    default = "traffic"
    type = string
  
}

variable "bandwidth_cce_node_charge_mode" {
    description = "Bandwidth charge mode"
    default = "traffic"
    type = string
  
}

variable "bandwidth_cce_cluster_charge_mode" {
    description = "Bandwidth charge mode"
    default = "traffic"
    type = string
  
}

variable "apig_count" {
  description = "value of the number of apig (0 to destroy/1 to create)"
  default = 1
  type = number
  
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
  default     = "cce-node-default"
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

variable "keypair_name" {
  description = "Name of your Huawei Cloud keypair"
  default     = "mykeypair"
  type        = string
  sensitive   = true  # The value of this variable is sensitive and should not be displayed in logs or outputs
}

variable "keypair_file" {
  description = "location where the keypair file will be stored"
  default = null
  type        = string
  
  
}