resource "google_sql_database_instance" "example" {
  name                = var.instance_name
  database_version    = var.database_version
  region              = var.region
  deletion_protection = var.deletion_protection

  settings {
    tier = var.tier

    backup_configuration {
      enabled = var.backup_enabled
    }

    ip_configuration {
      ipv4_enabled                                  = var.ipv4_enabled
      private_network                               = var.private_network
      enable_private_path_for_google_cloud_services = var.enable_private_path
      # authorized_networks {
      #   name  = "default"
      #   value = "0.0.0.0/0"
      # }
    }
  }

  depends_on = [google_service_networking_connection.private_vpc_connection]
}

resource "google_sql_database" "example_db" {
  name     = var.db_name
  instance = google_sql_database_instance.example.name
}

resource "google_sql_user" "example_user" {
  for_each   = var.db_users
  name       = each.key
  password   = each.value
  host       = "%"
  instance   = google_sql_database_instance.example.name
  depends_on = [google_sql_database_instance.example]
}


