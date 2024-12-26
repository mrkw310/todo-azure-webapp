resource "azurerm_mysql_flexible_server" "mysql" {
  name                = "${var.project}-${var.environment}-mysql-matsumoto-2"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "Japan East"
  sku_name            = "B_Standard_B1ms"

  administrator_login    = var.mysql_username
  administrator_password = var.mysql_password

  version = "8.0.21"

  lifecycle {
    ignore_changes = [
      administrator_login,
      administrator_password,
      zone
    ]
  }
}

resource "azurerm_mysql_flexible_server_firewall_rule" "mysql" {
  name                = "AllowAllAzureServices"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_mysql_flexible_server.mysql.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

resource "azurerm_mysql_flexible_database" "mysql" {
  name                = var.mysql_database
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_mysql_flexible_server.mysql.name
  charset             = "utf8mb4"
  collation           = "utf8mb4_unicode_ci"
}