
---

# Terraform Configuration Documentation

## Overview

This Terraform configuration defines a set of infrastructure resources and configurations for managing and deploying resources in the Huawei Cloud environment. It utilizes various modules to create Virtual Private Cloud (VPC), Elastic IP (EIP) addresses, Cloud Container Engine (CCE) clusters, FunctionGraph (FG) functions, API Gateway instances, triggers, and more.

## Prerequisites

Before you begin, ensure you have the following:

1. Huawei Cloud account credentials.
2. Terraform installed on your local machine.
3. AK/SK created in Huawei Cloud
4. Set the following environment variables:
    
    - HW_ACCESS_KEY
    - HW_SECRET_KEY
    - AWS_ACCESS_KEY_ID
    - AWS_SECRET_ACCESS_KEY
5. Set your variables in the .tfvars file    

## Modules and Resources

### 1. Provider Configuration

A provider configuration for the `huaweicloud` provider is defined to specify the region.

```hcl
provider "huaweicloud" {
  region = var.region
}
```

### 2. Data Source - `huaweicloud_networking_secgroup`

A data source is used to retrieve information about a security group by its name.

```hcl
data "huaweicloud_networking_secgroup" "secgroup" {
  name = var.secgroup_name
}
```

### 3. Module - `vpc-cce`

This module creates a Virtual Private Cloud (VPC) and a subnet for the resources 'cce' and 'dedicated-apig'.

```hcl
module "vpc-cce" {
  source       = "../../modules/vpc"
  region       = var.region
  vpc_name     = var.vpc_cce_name
  subnet_name  = var.subnet_cce_name
}
```

### 4. Module - `eip-apig`

This module creates an Elastic IP (EIP) address for API Gateway instances.

```hcl
module "eip-apig" {
  source                = "../../modules/eip"
  region                = var.region
  publicip_type         = var.publicip_apig_type
  bandwidth_share_type  = var.bandwidth_apig_share_type
  bandwidth_name        = var.bandwidth_apig_name
  bandwidth_size        = var.bandwidth_apig_size
  bandwidth_charge_mode = var.bandwidth_apig_charge_mode
}
```

### 5. Module - `eip-cce-cluster`

This module creates an Elastic IP (EIP) address for the CCE cluster.

```hcl
module "eip-cce-cluster" {
  source                = "../../modules/eip"
  region                = var.region
  publicip_type         = var.publicip_cce_cluster_type
  bandwidth_share_type  = var.bandwidth_cce_cluster_share_type
  bandwidth_name        = var.bandwidth_cce_cluster_name
  bandwidth_size        = var.bandwidth_cce_cluster_size
  bandwidth_charge_mode = var.bandwidth_cce_cluster_charge_mode
}
```

### 6. Module - `eip-cce-node`

This module creates an Elastic IP (EIP) address for CCE nodes.

```hcl
module "eip-cce-node" {
  source                = "../../modules/eip"
  region                = var.region
  publicip_type         = var.publicip_cce_node_type
  bandwidth_share_type  = var.bandwidth_cce_node_share_type
  bandwidth_name        = var.bandwidth_cce_node_name
  bandwidth_size        = var.bandwidth_cce_node_size
  bandwidth_charge_mode = var.bandwidth_cce_node_charge_mode
}
```

### 7. Module - `cce`

This module creates a Cloud Container Engine (CCE) cluster along with nodes.

```hcl
module "cce" {
  source             = "../../modules/cce"
  cce_name           = var.cce_name
  cce_flavor_id      = var.cce_flavor_id
  node_flavor_id     = var.node_flavor_id
  vpc_id             = module.vpc-cce.vpc_id
  subnet_id          = module.vpc-cce.subnet_id
  container_network_type = var.container_network_type
  cce_node_name      = var.cce_node_name
  root_volume_size   = var.root_volume_size
  data_volume_size   = var.data_volume_size
  root_volumetype    = var.root_volumetype
  data_volumetype    = var.data_volumetype
  keypair_name       = var.keypair_name
  node_eip_id        = module.eip-cce-node.eip_id
  cluster_eip        = module.eip-cce-cluster.ip_address
}
```

### 8. Module - `fgs-function-start`

This module creates an FG function for starting servers, along with associated configurations.

```hcl
module "fgs-function-start" {
  source                = "../../modules/fg/function"
  region                = var.region
  dependencies_type     = var.dependencies_type
  dependency_name       = var.dependency_name
  runtime               = var.runtime
  fg-region             = var.fg-region
  fg-domain             = var.fg-domain
  fg-projectId          = var.fg-projectId
  fgs_function_name     = var.fgs_start_function_name
  fgs_app               = var.fgs_app
  fgs_agency            = var.fgs_agency
  fgs_handle            = var.fgs_handle
  fgs_memory            = var.fgs_memory
  fgs_timeout           = var.fgs_timeout
  code_url              = var.fgs_start_code_url
  whiteLists            = module.cce.node_name
}
```

### 9. Module - `fgs-function-stop`

This module creates an FG function for stopping servers, along with associated configurations.

```hcl
module "fgs-function-stop" {
  source                = "../../modules/fg/function"
  region                = var.region
  dependencies_type     = var.dependencies_type
  dependency_name       = var.dependency_name
  runtime               = var.runtime
  fg-region             = var.fg-region
  fg-domain             = var.fg-domain
  fg-projectId          = var.fg-projectId
  fgs_function_name     = var.fgs_stop_function_name
  fgs_app               = var.fgs_app
  fgs_agency            = var.fgs_agency
  fgs_handle            = var.fgs_handle
  fgs_memory            = var.fgs_memory
  fgs_timeout           = var.fgs_timeout
  code_url              = var.fgs_stop_code_url
  whiteLists            = module.cce.node_name
}
```

### 10. Module - `dedicated-apig`

This module creates dedicated API Gateway instances.

```hcl
module "dedicated-apig" {
  count                = var.apig_count
  source               = "../../modules/apig"
  region               = var.region
  apig_region          = var.apig_region
  apig_secgroupid      = data.huaweicloud_networking_secgroup.secgroup.id
  apig_edition         = var.apig_edition
  apig_vpcid           = module.vpc-cce.vpc_id
  apig_subnetid        = module.vpc-cce.subnet_id
  apig_description     = var.apig_description
  apig_eipid           = module.eip-apig.eip_id
  instance_name        = var.instance_name
}
```

### 11. Module - `apig-group

`

This module creates an API Gateway group.

```hcl
module "apig-group" {
  source            = "../../modules/apig_group"
  region            = var.region
  apig_region       = var.apig_region
  apig_instanceid   = module.dedicated-apig[0].apig_instanceid
  apig_group_name   = var.apig_group_name
}
```

### 12. Module - `fgs-start-trigger`

This module creates a trigger for the FG function responsible for starting servers.

```hcl
module "fgs-start-trigger" {
  source                = "../../modules/fg/trigger"
  fg-region             = var.fg-region
  fgs_urn               = module.fgs-function-start.urn
  trigger_apig_type     = var.trigger_apig_type
  trigger_status        = var.trigger_status
  apig_instanceid       = module.dedicated-apig[0].apig_instanceid
  apig_groupid          = module.apig-group.apig_group_id
  api_name              = var.start_api_name
  env_name              = var.env_name
  request_protocol      = var.request_protocol
  security_authentication = var.security_authentication
  timeout               = var.timeout
}
```

### 13. Module - `fgs-stop-trigger`

This module creates a trigger for the FG function responsible for stopping servers.

```hcl
module "fgs-stop-trigger" {
  source                = "../../modules/fg/trigger"
  fg-region             = var.fg-region
  fgs_urn               = module.fgs-function-stop.urn
  trigger_apig_type     = var.trigger_apig_type
  trigger_status        = var.trigger_status
  apig_instanceid       = module.dedicated-apig[0].apig_instanceid
  apig_groupid          = module.apig-group.apig_group_id
  api_name              = var.stop_api_name
  env_name              = var.env_name
  request_protocol      = var.request_protocol
  security_authentication = var.security_authentication
  timeout               = var.timeout
}
```

## Inputs and Variables

The Terraform configuration utilizes several input variables to parameterize the resource creation process. These input variables can be defined in the .tfvars file and passed when executing the Terraform configuration.


## Usage

To use this Terraform configuration, define the necessary environment variables and input variables in a ".tfvars" file. Then, execute the following Terraform commands in the working directory:

1. Initialize the configuration: `terraform init`
2. Review the changes: `terraform plan -var-file="my-variables.tfvars"`
3. Apply the changes: `terraform apply -var-file="my-variables.tfvars"`

## Conclusion

This Terraform configuration automates the deployment of various resources in the Huawei Cloud environment, such as VPCs, EIPs, CCE clusters, FG functions, API Gateway instances, and triggers. It allows for consistent and repeatable infrastructure deployment while promoting best practices in managing cloud resources.
