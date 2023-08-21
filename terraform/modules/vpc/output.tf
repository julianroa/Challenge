output "vpc_name" {
  value = huaweicloud_vpc.vpc.name  
}
output "subnet_name" {
  value = huaweicloud_vpc_subnet.subnet.name
}

output "vpc_id" {
    value = huaweicloud_vpc.vpc.id
}

output "subnet_id" {
    value = huaweicloud_vpc_subnet.subnet.id
}
  