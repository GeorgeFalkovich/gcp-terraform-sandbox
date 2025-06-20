resource "google_compute_instance" "module-vm" {
  name                      = var.instance_name
  machine_type              = var.instance_type
  zone                      = var.zone
  allow_stopping_for_update = true

  boot_disk {
    dynamic "initialize_params" {
      for_each = var.boot_disk_attached ? [] : [1]
      content {
        image = var.instance_image
        size  = var.disk_size
        type  = var.disk_type
      }
    }
    source = var.disk_source
  }
  metadata_startup_script = var.start_up_script
  tags                    = var.tags
  labels                  = var.labels

  network_interface {
    network    = var.vpc_name
    subnetwork = var.subnet_name
    network_ip = var.private_ip

    dynamic "access_config" {
      for_each = var.assign_public_ip ? [1] : []
      content {
        nat_ip = var.access_config_nat_ip
      }
    }
  }


}

