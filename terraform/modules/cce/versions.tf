# Specify the required Terraform version and the Huawei Cloud provider version.
terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = "~> 1.47.1"
    }
  }
}
