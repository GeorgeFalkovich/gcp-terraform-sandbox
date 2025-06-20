module "gke" {
  source                = "./modules/gke"
  cluster_name          = "my-gke-cluster"
  location              = var.zone
  node_count            = 3
  machine_type          = var.machine_type
  disk_size_gb          = 100
  node_labels           = { pool = "alpha" }
  node_tags             = var.node_tags
  enable_shielded_nodes = false
  logging_components    = ["WORKLOADS", "APISERVER", "SYSTEM_COMPONENTS"]
  node_pool_name        = "alpha-pool"
  private_cluster       = true
  network_policy        = true
}



