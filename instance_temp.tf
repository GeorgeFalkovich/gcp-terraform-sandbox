resource "google_service_account" "sa-template" {
  account_id   = "sa-it-template"
  display_name = "Service Account for instance templates"
}

resource "google_compute_instance_template" "show-details-template" {
  name                    = "show-details-template"
  description             = "This template is used to create app server instances."
  metadata_startup_script = file("./startup/show-details.sh")

  tags = ["show-details"]

  labels = {
    environment = "dev"
  }

  instance_description = "description assigned to instances"
  machine_type         = "e2-medium"
  can_ip_forward       = false

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  // Create a new boot disk from an image
  disk {
    source_image = "debian-cloud/debian-11"
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network = "default"
  }

  metadata = {
    foo = "bar"
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.sa-template.email
    scopes = ["cloud-platform"]
  }
}




resource "google_compute_instance_template" "worker-template" {
  name                    = "worker-template"
  description             = "This template is used to allow replace templates."
  metadata_startup_script = file("./startup/show-details.sh")

  tags = ["worker-template"]

  labels = {
    environment = "dev"
  }

  machine_type   = "e2-medium"
  can_ip_forward = false

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  // Create a new boot disk from an image
  disk {
    source_image = "debian-cloud/debian-11"
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network = "default"
  }

  metadata = {
    foo = "bar"
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.sa-template.email
    scopes = ["cloud-platform"]
  }
}

data "google_compute_image" "my_image" {
  family  = "debian-11"
  project = "debian-cloud"
}


