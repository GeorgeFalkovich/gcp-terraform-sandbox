# # forwarding rule
# resource "google_compute_global_forwarding_rule" "default" {
#   name                  = "l7-xlb-forwarding-rule"
#   provider              = google-beta
#   ip_protocol           = "TCP"
#   load_balancing_scheme = "EXTERNAL"
#   port_range            = "80"
#   target                = google_compute_target_http_proxy.default.id
#   ip_address            = google_compute_global_address.lb_ip.id
# }

# # http proxy
# resource "google_compute_target_http_proxy" "default" {
#   name     = "l7-xlb-target-http-proxy"
#   provider = google-beta
#   url_map  = google_compute_url_map.default.id
# }

# # url map
# resource "google_compute_url_map" "default" {
#   name            = "l7-xlb-url-map"
#   provider        = google-beta
#   default_service = google_compute_backend_service.default.id
#   project         = var.gcp_project

# }

# # backend service with custom request and response headers
# resource "google_compute_backend_service" "default" {
#   name                    = "l7-xlb-backend-service"
#   provider                = google-beta
#   protocol                = "HTTP"
#   port_name               = "http-main"
#   load_balancing_scheme   = "EXTERNAL"
#   timeout_sec             = 10
#   enable_cdn              = true
#   custom_request_headers  = ["X-Client-Geo-Location: {client_region_subdivision}, {client_city}"]
#   custom_response_headers = ["X-Cache-Hit: {cdn_cache_status}"]
#   health_checks           = [google_compute_health_check.autohealing.id]
#   backend {
#     group           = google_compute_instance_group_manager.show_details_mig.instance_group
#     balancing_mode  = "UTILIZATION"
#     capacity_scaler = 1.0
#   }

# }