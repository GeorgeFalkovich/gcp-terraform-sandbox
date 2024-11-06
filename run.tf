resource "google_cloud_run_v2_service" "show-host-details" {
  name                = "show-host-details-tf"
  location            = var.region_default
  deletion_protection = false
  ingress             = "INGRESS_TRAFFIC_ALL"


  template {
    containers {
      image = "us-central1-docker.pkg.dev/georgef-sandbox/show-host-details/show-host-details/v1.1"
      ports {
        container_port = 80
      }
      resources {
        limits = {
          cpu    = "2"
          memory = "1024Mi"
        }
      }
    }
  }
}

resource "google_cloud_run_service_iam_binding" "default" {
  location = google_cloud_run_v2_service.show-host-details.location
  service  = google_cloud_run_v2_service.show-host-details.name
  role     = "roles/run.invoker"
  members = [
    "allUsers"
  ]
}
