
resource "huaweicloud_vpc_eip" "dedicated-eip" {
  publicip {
    type = var.publicip_type
  }

  bandwidth {
    share_type  = var.bandwidth_share_type
    name        = var.bandwidth_name
    size        = var.bandwidth_size #300
    charge_mode = var.bandwidth_charge_mode #"traffic"
  }
}
