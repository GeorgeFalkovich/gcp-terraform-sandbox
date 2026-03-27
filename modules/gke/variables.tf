variable "cluster_name" {}
variable "location" {}
variable "node_count" {}
variable "machine_type" {}
variable "disk_size_gb" {}
variable "node_labels" { type = map(string) }
variable "node_tags" { type = list(string) }
variable "enable_shielded_nodes" { default = false }
variable "logging_components" { type = list(string) }
variable "node_pool_name" {
  description = "Name of the GKE node pool"
  type        = string
}
variable "private_cluster" {
  description = "Whether the GKE cluster is private (nodes have internal IPs only)"
  type        = bool
  default     = false
}
variable "network_policy" {
  description = "Whether to enable network policy on the GKE cluster"
  type        = bool
  default     = false
}
