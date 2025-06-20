### Global vars
google_application_credentials  = "creds/key.json"
project_id                      = "georgef-sandbox"
region                          = "us-central1"
zone                            = "us-central1-a"
vpc_name                        = "default"
vpc_subnet_name                 = "default"
machine_type                    = "e2-small"
router_name                     = "my-router"
nat_log_enable                  = true
nat_name                        = "my-nat"
network_name                    = "default"
nat_log_filter                  = "ERRORS_ONLY"
nat_ip_allocate_option          = "AUTO_ONLY"
nat_asn                         = 64514
nat_source_subnetwork_ip_ranges = "ALL_SUBNETWORKS_ALL_IP_RANGES"
full_vpc_name                   = "projects/georgef-sandbox/global/networks/default"
node_tags = [ "alpha", "beta" ]

# Random tags for resources
resource_tags = {
  environment = "dev"
  owner       = "george"
  project     = "alpha"
  costcenter  = "rnd-123"
  department  = "engineering"
}