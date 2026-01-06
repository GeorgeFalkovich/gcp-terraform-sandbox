# # GCP Memory Store for Redis Instance
# resource "google_redis_instance" "main" {
#   name           = "redis-${var.project_id}"
#   tier           = "STANDARD_HA"
#   memory_size_gb = 1
  
#   region                  = var.region
#   location_id             = var.zone
#   alternative_location_id = "${var.region}1-b"
  
#   authorized_network = "projects/${var.project_id}/global/networks/${var.vpc_name}"
  
#   redis_version     = "REDIS_6_X"
#   display_name      = "Redis Instance for ${var.project_id}"
  
#   # Enable AUTH
#   auth_enabled = true
  
#   # Redis configuration parameters
#   redis_configs = {
#     maxmemory-policy = "allkeys-lru"
#     notify-keyspace-events = "Ex"
#   }
  
#   # Maintenance policy
#   maintenance_policy {
#     weekly_maintenance_window {
#       day = "SUNDAY"
#       start_time {
#         hours   = 2
#         minutes = 0
#         seconds = 0
#         nanos   = 0
#       }
#     }
#   }
  
#   labels = {
#     environment = "dev"
#     owner       = "george"
#     project     = "alpha"
#     service     = "redis"
#   }
# }

# # Output values for use in other resources
# output "redis_host" {
#   description = "The IP address of the Redis instance"
#   value       = google_redis_instance.main.host
# }

# output "redis_port" {
#   description = "The port number of the Redis instance"
#   value       = google_redis_instance.main.port
# }

# output "redis_auth_string" {
#   description = "The AUTH string for the Redis instance"
#   value       = google_redis_instance.main.auth_string
#   sensitive   = true
# }

# output "redis_connection_string" {
#   description = "Redis connection string"
#   value       = "${google_redis_instance.main.host}:${google_redis_instance.main.port}"
# }

# output "redis_instance_id" {
#   description = "The Redis instance ID"
#   value       = google_redis_instance.main.id
# }
