resource "google_service_account" "gke-sa" {
  account_id   = "my-gke-service-account"
  display_name = "A service account for GKE cluster"
}

resource "google_project_iam_member" "kubernates-admin" {
  project = var.gcp_project
  member  = "serviceAccount:${google_service_account.gke-sa.email}"
  role    = "roles/container.admin"

}

resource "google_project_iam_member" "ar-admin" {
  project = var.gcp_project
  member  = "serviceAccount:${google_service_account.gke-sa.email}"
  role    = "roles/artifactregistry.admin"
}



