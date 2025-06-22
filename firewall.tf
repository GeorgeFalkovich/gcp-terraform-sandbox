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

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-mysql"]
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

  source_ranges = ["0.0.0.0/0"]
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
  target_tags   = []
}
