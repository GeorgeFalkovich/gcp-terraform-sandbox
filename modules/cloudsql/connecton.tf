resource "google_compute_global_address" "private_ip_address" {
  name          = var.peering_range_name
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = var.peering_prefix_length
  network       = var.vpc_name
}

resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = var.vpc_name
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
  depends_on              = [google_compute_global_address.private_ip_address]
}