# module "cloud_nat" {
#   source                             = "./modules/cloud-nat"
#   vpc_name                           = var.vpc_name
#   log_filter                         = var.nat_log_filter
#   router_name                        = var.router_name
#   log_enable                         = var.nat_log_enable
#   region                             = var.region
#   nat_name                           = var.nat_name
#   network                            = var.network_name
#   nat_ip_allocate_option             = var.nat_ip_allocate_option
#   asn                                = var.nat_asn
#   source_subnetwork_ip_ranges_to_nat = var.nat_source_subnetwork_ip_ranges
# }
