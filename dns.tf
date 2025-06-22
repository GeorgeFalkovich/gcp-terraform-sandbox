# resource "google_dns_record_set" "lb-a" {
#   name         = "lb.george-falkovich.com."
#   managed_zone = "george-falkovich"
#   type         = "A"
#   ttl          = 300
#   # rrdatas      = [data.google_compute_global_address.lb-ip.address]
#   depends_on   = [google_compute_global_address.lb_ip]
# }

# resource "google_dns_record_set" "jenkins-a" {
#   name         = "jenkins.george-falkovich.com."
#   managed_zone = "george-falkovich"
#   type         = "A"
#   ttl          = 300
#   # rrdatas      = [data.google_compute_address.jenkins_ip.address]
#   depends_on   = [google_compute_address.jenkins_ip]
# }

# resource "google_dns_record_set" "jenkins-k8s" {
#   name         = "k8s-jenkins.george-falkovich.com."
#   managed_zone = "george-falkovich"
#   type         = "A"
#   ttl          = 300
#   # rrdatas      = ["34.41.186.110"]
# }

# resource "google_dns_record_set" "jenkins-agent-a" {
#   name         = "jenkins-agent.george-falkovich.com."
#   managed_zone = "george-falkovich"
#   type         = "A"
#   ttl          = 300
#   # rrdatas      = [data.google_compute_address.jenkins_agent_ip.address]
#   # depends_on   = [google_compute_address.jenkins_ip]
# }

# resource "google_dns_record_set" "portfolio-a" {
#   name         = "george-falkovich.com."
#   managed_zone = "george-falkovich"
#   type         = "A"
#   ttl          = 300
#   # rrdatas      = [data.google_compute_address.portfolio-ip.address]
#   # depends_on   = [google_compute_address.portfolio_site_ip]
# }

# resource "google_dns_record_set" "portfolio-www-a" {
#   name         = "www.george-falkovich.com."
#   managed_zone = "george-falkovich"
#   type         = "A"
#   ttl          = 300
#   rrdatas      = [data.google_compute_address.portfolio-ip.address]
#   # depends_on   = [google_compute_address.portfolio_site_ip]
# }