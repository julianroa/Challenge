

resource "huaweicloud_fgs_trigger" "apig-trigger" {
  region       = var.fg-region
  function_urn = var.fgs_urn
  type         = var.trigger_apig_type   #"DEDICATEDGATEWAY"
  status       = var.trigger_status #"ACTIVE"

  apig {
    instance_id = var.apig_instanceid   #"24bb23387e5e49f690f90b0b84baf113"
    group_id    = var.apig_groupid  #"61a2b6bbf28147ff94836b92e05e1adc"
    api_name    = var.api_name
    env_name    = var.env_name #"RELEASE"
    request_protocol = var.request_protocol #"HTTP"
    security_authentication = var.security_authentication   #"NONE"
    timeout = var.timeout   #60000
  }
 
}