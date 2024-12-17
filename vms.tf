module "siege" {
  source           = "./modules/vm"
  instance_name    = "siege-vegeta"
  vpc_name         = var.vpc_default
  subnet_name      = var.vpc_subnet_default
  zone             = var.zone_default
  assign_public_ip = true
  start_up_script  = file("./startup/siege-install.sh")
  tags             = ["siege"]
  instance_image   = "ubuntu-2004-focal-v20240307b"
}

module "jenkins" {
  source               = "./modules/vm"
  instance_name        = "jenkins"
  vpc_name             = var.vpc_default
  subnet_name          = var.vpc_subnet_default
  zone                 = var.zone_default
  assign_public_ip     = true
  start_up_script      = file("./startup/jenkins-install.sh")
  tags                 = ["jenkins"]
  instance_image       = "ubuntu-2004-focal-v20240307b"
  instance_type        = "n2-standard-2"
  access_config_nat_ip = google_compute_address.jenkins_ip.address
  boot_disk_attached   = true
  disk_source          = google_compute_disk.jenkins_disk.name
  labels               = { app = "jenkins" }
}

module "jenkins-agent" {
  source               = "./modules/vm"
  instance_name        = "jenkins-agent"
  vpc_name             = var.vpc_default
  subnet_name          = var.vpc_subnet_default
  zone                 = var.zone_default
  assign_public_ip     = true
  access_config_nat_ip = google_compute_address.jenkins_agent_ip.address
  start_up_script      = file("./startup/jenkins-agent-install.sh")
  tags                 = ["jenkins-agent"]
  instance_image       = "ubuntu-2004-focal-v20240307b"
  instance_type        = "e2-medium"
  boot_disk_attached   = false
  labels               = { app = "jenkins-agent" }
}

module "portfolio" {
  source               = "./modules/vm"
  instance_name        = "portfolio"
  vpc_name             = var.vpc_default
  subnet_name          = var.vpc_subnet_default
  zone                 = var.zone_default
  assign_public_ip     = true
  start_up_script      = file("./startup/portfolio-install.sh")
  tags                 = ["portfolio", "mysql"]
  instance_image       = "ubuntu-2004-focal-v20240307b"
  instance_type        = "e2-medium"
  access_config_nat_ip = google_compute_address.portfolio_site_ip.address
  boot_disk_attached   = true
  disk_source          = google_compute_disk.portfolio_disk.name
  labels               = { app = "portfolio" }
  depends_on           = [google_compute_disk.portfolio_disk, google_compute_disk.portfolio_disk]
}