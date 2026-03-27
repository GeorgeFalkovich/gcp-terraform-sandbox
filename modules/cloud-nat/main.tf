resource "google_compute_router" "router" {
  name    = var.router_name
  region  = var.region
  network = var.vpc_name

  bgp {
    asn = var.asn
  }
}

resource "google_compute_router_nat" "nat" {
  name                               = var.nat_name
  router                             = google_compute_router.router.name
  region                             = var.region
  nat_ip_allocate_option             = var.nat_ip_allocate_option
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat

  log_config {
    enable = var.log_enable
    filter = var.log_filter
  }
}
