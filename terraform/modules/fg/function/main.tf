

data "huaweicloud_fgs_dependencies" "dependencies" {
  type = var.dependencies_type #"public"
  name = var.dependency_name #"openstacksdk-1.0.6"
  runtime = var.runtime #"Python2.7"
}


resource "huaweicloud_fgs_function" "fgs-function" {
  name        = var.fgs_function_name #"batch-start-ecs"
  app         = var.fgs_app  #"default"
  agency      = var.fgs_agency  #"ecsOperation"
  handler     = var.fgs_handle  #"index.handler"
  memory_size = var.fgs_memory  #128
  timeout     = var.fgs_timeout #60
  runtime     = var.runtime #"Python2.7"
  code_type   = "obs"
  code_url   = var.code_url #"https://test1-a86c.obs.la-south-2.myhuaweicloud.com/ecs_start_api_py2.7.zip"
  user_data = jsonencode({
    region = var.fg-region
    domain = var.fg-domain
    projectId = var.fg-projectId
    whiteLists = var.whiteLists
  })
  depend_list = [data.huaweicloud_fgs_dependencies.dependencies.packages[0].id]
  
}

