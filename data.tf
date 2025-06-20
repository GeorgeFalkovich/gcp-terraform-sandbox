# data "google_client_config" "current" {}

# data "google_compute_address" "jenkins_ip" {
#   name = "jenkins-static-ip"
# }

# data "google_compute_address" "jenkins_agent_ip" {
#   name       = "jenkins-agent-static-ip"
#   depends_on = [google_compute_address.jenkins_agent_ip]
# }


# # data "google_compute_global_address" "lb-ip" {
# #   name = "lb-ip"
# # }

# data "google_compute_address" "portfolio-ip" {
#   name = "portfolio-static-ip"
# }

data "google_client_config" "current" {}