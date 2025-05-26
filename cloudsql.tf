
# resource "google_sql_database_instance" "example" {
#   name                = "example-sql-instance"
#   database_version    = "MYSQL_8_0"
#   region              = "us-central1"
#   deletion_protection = false

#   settings {
#     tier = "db-n1-standard-1" # Change to a suitable tier for your needs

#     backup_configuration {
#       enabled = true
#     }

#     ip_configuration {
#       ipv4_enabled                                  = false
#       private_network                               = "projects/georgef-sandbox/global/networks/default"
#       enable_private_path_for_google_cloud_services = true
#     }
#   }
# }

# resource "google_sql_database" "example_db" {
#   name     = "exampledb"
#   instance = google_sql_database_instance.example.name
# }

# resource "google_sql_user" "example_user" {
#   name     = "exampleuser"
#   instance = google_sql_database_instance.example.name
#   password = "examplepassword" # Replace with a strong password
# }

# output "instance_connection_name" {
#   value = google_sql_database_instance.example.connection_name
# }



resource "google_compute_global_address" "private_ip_address" {
  provider      = google-beta
  name          = "private-ip-address"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 24
  network       = var.vpc_default
}

resource "google_service_networking_connection" "private_vpc_connection" {
  provider                = google-beta
  network                 = var.vpc_default
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = ["default-ip-range"]
}