
data "huaweicloud_availability_zones" "myaz" {}

resource "huaweicloud_cce_cluster" "mycce" {
  name                   = var.cce_name
  flavor_id              = var.cce_flavor_id #"cce.s2.small"
  vpc_id                 = var.vpc_id #huaweicloud_vpc.myvpc.id
  subnet_id              = var.subnet_id  #huaweicloud_vpc_subnet.mysubnet.id
  container_network_type = var.container_network_type #"overlay_l2"
  eip = var.cluster_eip
}

resource "huaweicloud_compute_keypair" "mykeypair" {
  name       = var.keypair_name
  key_file   = var.keypair_file
}

resource "huaweicloud_cce_node" "mynode" {
  cluster_id        = huaweicloud_cce_cluster.mycce.id
  name              = var.cce_node_name
  flavor_id         = var.node_flavor_id #"c6s.xlarge.2"
  availability_zone = data.huaweicloud_availability_zones.myaz.names[0]
  key_pair          = huaweicloud_compute_keypair.mykeypair.name
  runtime = "docker"

  root_volume {
    size       = var.root_volume_size #40
    volumetype = var.root_volumetype #"SAS"
  }
  data_volumes {
    size       = var.data_volume_size #100
    volumetype = var.data_volumetype #"SAS"
  }
  eip_id = var.node_eip_id
}