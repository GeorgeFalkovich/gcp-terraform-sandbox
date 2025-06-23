module "cloudsql" {
  source              = "./modules/cloudsql"
  instance_name       = "sql-instance"
  database_version    = "MYSQL_8_0"
  region              = "us-central1"
  deletion_protection = false
  tier                = "db-f1-micro"
  backup_enabled      = false
  ipv4_enabled        = true
  private_network     = var.full_vpc_name
  enable_private_path = true
  db_name             = "exampledb"
  db_users = {
    "admin"    = "adminpassword"
    "admin2"   = "adminpassword2"
    "readonly" = "readonlypassword"
  }
  db_password           = "examplepassword"
  vpc_name              = var.full_vpc_name
  peering_range_name    = "default-ip-range"
  peering_prefix_length = 24
}
