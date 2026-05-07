output "app_service_name" {
  description = "Nombre del App Service desplegado"
  value       = azurerm_linux_web_app.app_service.name
}

output "app_service_default_hostname" {
  description = "URL del App Service"
  value       = azurerm_linux_web_app.app_service.default_hostname
}

output "resource_group_name" {
  description = "Nombre del Resource Group"
  value       = azurerm_resource_group.rg.name
}
