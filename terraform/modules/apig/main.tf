


data "huaweicloud_availability_zones" "myaz" {}

resource "huaweicloud_apig_instance" "dedicated-apig" {
  region                = var.apig_region
  name                  = var.instance_name
  edition               = var.apig_edition  #"BASIC"
  vpc_id                = var.apig_vpcid  #huaweicloud_vpc.vpc.id
  subnet_id             = var.apig_subnetid #huaweicloud_vpc_subnet.subnet.id
  security_group_id     = var.apig_secgroupid #data.huaweicloud_networking_secgroup.secgroup.id
  description           = var.apig_description  #"Created by tf"
  eip_id                = var.apig_eipid  #huaweicloud_vpc_eip.dedicated-eip.id

  available_zones = [
    data.huaweicloud_availability_zones.myaz.names[0],
    data.huaweicloud_availability_zones.myaz.names[1],
  ]
}


