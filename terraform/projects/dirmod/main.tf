provider "huaweicloud" {
    region = var.region
}

data "huaweicloud_networking_secgroup" "secgroup" {
  name = var.secgroup_name
}



module "vpc-cce" {
  source = "../../modules/vpc"
  region = var.region
  vpc_name = var.vpc_cce_name
  subnet_name = var.subnet_cce_name
}

module "eip-apig" {
  source = "../../modules/eip"
  region = var.region
  publicip_type = var.publicip_apig_type
  bandwidth_share_type = var.bandwidth_apig_share_type
  bandwidth_name = var.bandwidth_apig_name
  bandwidth_size = var.bandwidth_apig_size
  bandwidth_charge_mode = var.bandwidth_apig_charge_mode
}

module "eip-cce-cluster" {
  source = "../../modules/eip"
  region = var.region
  publicip_type = var.publicip_cce_cluster_type
  bandwidth_share_type = var.bandwidth_cce_cluster_share_type
  bandwidth_name = var.bandwidth_cce_cluster_name
  bandwidth_size = var.bandwidth_cce_cluster_size
  bandwidth_charge_mode = var.bandwidth_cce_cluster_charge_mode
}

module "eip-cce-node" {
  source = "../../modules/eip"
  region = var.region
  publicip_type = var.publicip_cce_node_type
  bandwidth_share_type = var.bandwidth_cce_node_share_type
  bandwidth_name = var.bandwidth_cce_node_name
  bandwidth_size = var.bandwidth_cce_node_size
  bandwidth_charge_mode = var.bandwidth_cce_node_charge_mode
}

module "cce" {
  source = "../../modules/cce"
  cce_name = var.cce_name
  cce_flavor_id = var.cce_flavor_id
  node_flavor_id = var.node_flavor_id
  vpc_id = module.vpc-cce.vpc_id
  subnet_id = module.vpc-cce.subnet_id
  container_network_type = var.container_network_type
  cce_node_name = var.cce_node_name
  root_volume_size = var.root_volume_size
  data_volume_size = var.data_volume_size
  root_volumetype = var.root_volumetype
  data_volumetype = var.data_volumetype
  keypair_name = var.keypair_name
  node_eip_id = module.eip-cce-node.eip_id
  cluster_eip = module.eip-cce-cluster.ip_address
  
}


module "fgs-function-start" {
  source = "../../modules/fg/function"
  region = var.region
  dependencies_type = var.dependencies_type
  dependency_name = var.dependency_name
  runtime = var.runtime
  fg-region = var.fg-region
  fg-domain = var.fg-domain
  fg-projectId = var.fg-projectId
  fgs_function_name = var.fgs_start_function_name
  fgs_app = var.fgs_app
  fgs_agency = var.fgs_agency
  fgs_handle = var.fgs_handle
  fgs_memory = var.fgs_memory
  fgs_timeout = var.fgs_timeout
  code_url = var.fgs_start_code_url
  whiteLists = module.cce.node_name

}

module "fgs-function-stop" {
  source = "../../modules/fg/function"
  region = var.region
  dependencies_type = var.dependencies_type
  dependency_name = var.dependency_name
  runtime = var.runtime
  fg-region = var.fg-region
  fg-domain = var.fg-domain
  fg-projectId = var.fg-projectId
  fgs_function_name = var.fgs_stop_function_name
  fgs_app = var.fgs_app
  fgs_agency = var.fgs_agency
  fgs_handle = var.fgs_handle
  fgs_memory = var.fgs_memory
  fgs_timeout = var.fgs_timeout
  code_url = var.fgs_stop_code_url
  whiteLists = module.cce.node_name


}

module "dedicated-apig" {
  count = var.apig_count
  source = "../../modules/apig"
  region = var.region
  apig_region = var.apig_region
  apig_secgroupid = data.huaweicloud_networking_secgroup.secgroup.id
  apig_edition = var.apig_edition
  apig_vpcid = module.vpc-cce.vpc_id
  apig_subnetid = module.vpc-cce.subnet_id
  apig_description = var.apig_description
  apig_eipid = module.eip-apig.eip_id
  instance_name = var.instance_name
}

module "apig-group" {
  source = "../../modules/apig_group"
  region = var.region
  apig_region = var.apig_region
  apig_instanceid = module.dedicated-apig[0].apig_instanceid
  apig_group_name = var.apig_group_name
  
}

module "fgs-start-trigger" {
  source = "../../modules/fg/trigger"
  fg-region = var.fg-region
  fgs_urn = module.fgs-function-start.urn
  trigger_apig_type = var.trigger_apig_type
  trigger_status = var.trigger_status
  apig_instanceid = module.dedicated-apig[0].apig_instanceid
  apig_groupid = module.apig-group.apig_group_id
  api_name = var.start_api_name
  env_name = var.env_name
  request_protocol = var.request_protocol
  security_authentication = var.security_authentication
  timeout = var.timeout

  
}

module "fgs-stop-trigger" {
  source = "../../modules/fg/trigger"
  fg-region = var.fg-region
  fgs_urn = module.fgs-function-stop.urn
  trigger_apig_type = var.trigger_apig_type
  trigger_status = var.trigger_status
  apig_instanceid = module.dedicated-apig[0].apig_instanceid
  apig_groupid = module.apig-group.apig_group_id
  api_name = var.stop_api_name
  env_name = var.env_name
  request_protocol = var.request_protocol
  security_authentication = var.security_authentication
  timeout = var.timeout
}
