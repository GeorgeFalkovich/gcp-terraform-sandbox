resource "google_container_cluster" "primary" {
  name     = "my-gke-cluster"
  location = var.zone_default

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = false
  initial_node_count       = 3
  deletion_protection      = false

  node_config {
    labels = {pool = "default"}
    tags = [ "default-tag" ]
  }


  workload_identity_config {
    workload_pool = "${data.google_client_config.current.project}.svc.id.goog"
  }


  enable_shielded_nodes = false
  logging_config {
    enable_components = ["WORKLOADS", "APISERVER", "SYSTEM_COMPONENTS"]
  }

}

resource "google_container_node_pool" "alpha_pool" {
  name       = "alpha-pool"
  location   = var.zone_default
  cluster    = google_container_cluster.primary.name
  node_count = 3


  autoscaling {
    min_node_count = 3
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
      pool = "alpha"
    }
    tags = ["alpha-tag"]

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    # service_account = google_service_account.gke-sa.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

