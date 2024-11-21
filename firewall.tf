resource "google_compute_firewall" "mysql-allow" {
  name        = "mysql-allow"
  network     = "default"
  description = "Creates firewall rule to allow access mysql"
  priority    = 100
  direction   = "INGRESS"

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  allow {
    protocol = "tcp"
    ports    = ["3306", "33060"]
  }

  source_ranges = ["10.0.0.0/8", "147.235.214.165"]
  target_tags   = ["jenkins-agent"]
}

resource "google_compute_firewall" "jenkins-allow" {
  name        = "jenkins-allow-http-ssh"
  network     = "default"
  description = "Creates firewall rule to allow access jenkins"
  priority    = 800
  direction   = "INGRESS"

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  allow {
    protocol = "tcp"
    ports    = ["8080", "22"]
  }

  source_ranges = ["147.235.214.165", "192.30.252.0/22",
    "185.199.108.0/22",
    "140.82.112.0/20",
  "143.55.64.0/20", "35.235.240.0/20", "34.121.169.150", "10.128.0.0/16", "34.67.12.172", "34.135.41.103", "10.0.0.0/8"]
  target_tags = ["jenkins", "jenkins-agent"]
}

resource "google_compute_firewall" "ssh_allow" {
  name        = "allow-ssh"
  network     = "default"
  description = "Allow SSH on all instances"
  priority    = 100
  direction   = "INGRESS"

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["147.235.214.165", "35.235.240.0/20"]
  target_tags   = []
}

resource "google_compute_firewall" "http-s-allow" {
  name        = "allow-http-s"
  network     = "default"
  description = "Allow HTTP/S on all instances"
  priority    = 100
  direction   = "INGRESS"

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "443", "22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["portfolio", "jenkins-agent"]
}

# resource "google_compute_firewall" "http-temp-allow" {
#   name        = "allow-temp-s"
#   network     = "default"
#   description = "Allow HTTP/S on all instances"
#   priority    = 100
#   direction   = "INGRESS"

#   log_config {
#     metadata = "INCLUDE_ALL_METADATA"
#   }

#   allow {
#     protocol = "tcp"
#     ports    = []
#   }

#   source_ranges = ["0.0.0.0/0"]
#   target_tags   = ["portfolio", "jenkins-agent"]
# }