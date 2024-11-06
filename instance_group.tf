resource "google_compute_instance_group_manager" "show_details_mig" {
  name               = "show-details-mig-tf"
  base_instance_name = "show-details-add"
  zone               = var.zone_default
  version {
    # instance_template = google_compute_instance_template.worker-template.self_link_unique
    instance_template = google_compute_instance_template.show-details-template.self_link_unique
  }

  all_instances_config {
    metadata = {
      metadata_key = "metadata_value"
    }
    labels = {
      label_key = "label_value"
    }
  }

  # target_pools = [google_compute_target_pool.appserver.id]
  named_port {
    name = "http-main"
    port = 80
  }


  auto_healing_policies {
    health_check      = google_compute_health_check.autohealing.id
    initial_delay_sec = 300
  }

}

resource "google_compute_autoscaler" "show_details_mig" {
  name   = "show-details-mig-autoscaler"
  zone   = var.zone_default
  target = google_compute_instance_group_manager.show_details_mig.id

  autoscaling_policy {
    max_replicas    = 2
    min_replicas    = 0
    cooldown_period = 15

    cpu_utilization {
      target = 0.60
    }
  }
}

resource "google_compute_health_check" "autohealing" {
  name                = "autohealing-health-check"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 10 # 50 seconds

  http_health_check {
    request_path = "/"
    port         = "80"
  }
}



