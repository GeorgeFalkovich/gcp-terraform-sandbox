resource "google_compute_global_address" "external_ip" {
  name         = "gke-ingress-ip"
  address_type = "EXTERNAL"
}

resource "google_compute_global_address" "lb_ip" {
  name         = "lb-ip"
  address_type = "EXTERNAL"
}

resource "google_compute_address" "jenkins_ip" {
  name         = "jenkins-static-ip"
  address_type = "EXTERNAL"
  region       = var.region_default
}


resource "google_compute_address" "jenkins_agent_ip" {
  name         = "jenkins-agent-static-ip"
  address_type = "EXTERNAL"
  region       = var.region_default
}

resource "google_compute_address" "mysql_v1_ip" {
  name         = "mysql-v1-static-ip"
  address_type = "EXTERNAL"
  region       = var.region_default
}

resource "google_compute_address" "portfolio_site_ip" {
  name         = "portfolio-static-ip"
  address_type = "EXTERNAL"
  region       = var.region_default
}