module "web_app" {
  source      = "../../modules/azure_web_app"
  prefix      = "az400lab"
  environment = "dev"
  location    = "Norway East"
}

output "dev_app_url" {
  value = module.web_app.app_service_default_hostname
}
