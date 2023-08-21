


resource "huaweicloud_apig_group" "apig_group" {
  region      = var.apig_region
  instance_id = var.apig_instanceid
  name        = var.apig_group_name
}