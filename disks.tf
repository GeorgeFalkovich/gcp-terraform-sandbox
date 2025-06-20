# resource "google_compute_disk" "jenkins_disk" {
#   name  = "jenkins-disk"
#   type  = "pd-balanced"
#   zone  = var.zone_default
#   image = "ubuntu-2004-focal-v20240307b"
#   size  = "100"
#   labels = {
#     app = "jenkins"
#   }
#   physical_block_size_bytes = 4096
# }

# resource "google_compute_disk" "portfolio_disk" {
#   name  = "portfolio-site-disk"
#   type  = "pd-balanced"
#   zone  = var.zone_default
#   image = "ubuntu-2004-focal-v20240307b"
#   size  = "100"
#   labels = {
#     app = "portfolio"
#   }
#   physical_block_size_bytes = 4096
# }