data "google_client_config" "current" {}

resource "google_container_cluster" "primary" {
  name                     = var.cluster_name
  location                 = var.location
  remove_default_node_pool = true
  initial_node_count       = var.node_count
  deletion_protection      = false

  node_config {
    labels = var.node_labels
    tags   = var.node_tags
  }

  workload_identity_config {
    workload_pool = "${data.google_client_config.current.project}.svc.id.goog"
  }

  enable_shielded_nodes = var.enable_shielded_nodes
  logging_config {
    enable_components = var.logging_components
  }

  dynamic "private_cluster_config" {
    for_each = var.private_cluster ? [1] : []
    content {
      enable_private_nodes    = true
      enable_private_endpoint = false
      master_ipv4_cidr_block  = "172.16.0.0/28"
    }
  }

  dynamic "network_policy" {
    for_each = var.network_policy ? [1] : []
    content {
      enabled  = true
      provider = "CALICO"
    }
  }
}

resource "google_container_node_pool" "alpha_pool" {
  name       = var.node_pool_name
  location   = var.location
  cluster    = google_container_cluster.primary.name
  node_count = var.node_count

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }

  node_config {
    preemptible  = false
    machine_type = var.machine_type
    disk_size_gb = var.disk_size_gb
    workload_metadata_config {
      mode = "GKE_METADATA"
    }
    labels = var.node_labels
    tags   = var.node_tags
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
