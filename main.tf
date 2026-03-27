provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = file(var.google_application_credentials)
}

provider "google-beta" {
  project     = var.project_id
  region      = var.region
  credentials = file(var.google_application_credentials)
}


terraform {
  backend "gcs" {
    bucket = "georgef-tfs"
  }
}