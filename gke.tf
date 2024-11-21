resource "google_container_cluster" "primary" {
  name     = "my-gke-cluster"
  location = var.zone_default

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
  deletion_protection      = false

  workload_identity_config {
    workload_pool = "${data.google_client_config.current.project}.svc.id.goog"
  }

  enable_shielded_nodes = false
  logging_config {
    enable_components = ["WORKLOADS", "APISERVER", "SYSTEM_COMPONENTS"]
  }

}

resource "google_container_node_pool" "primary_node_pool" {
  name       = "my-node-pool"
  location   = var.zone_default
  cluster    = google_container_cluster.primary.name
  node_count = 2


  autoscaling {
    min_node_count = 2
    max_node_count = 5
  }


  node_config {
    preemptible  = false
    machine_type = "n1-standard-1"
    disk_size_gb = "100"


    workload_metadata_config {
      mode = "GKE_METADATA"
    }

    labels = {
      label_name = "label"
    }
    tags = ["tag1", "tag2", "bar"]

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.gke-sa.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

