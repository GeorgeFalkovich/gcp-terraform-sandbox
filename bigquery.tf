
resource "google_bigquery_dataset" "daily_metrics" {
  dataset_id  = "daily_metrics"
  location    = var.region
  description = "Daily health metrics tracking"

  labels = {
    app         = "daily-tracker"
  }

  delete_contents_on_destroy = false
}

# ============================================
# BigQuery Table - Daily Entries
# ============================================

resource "google_bigquery_table" "entries" {
  dataset_id = google_bigquery_dataset.daily_metrics.dataset_id
  table_id   = "entries"
  
  description = "Daily metric entries with mood, anxiety, nutrition, sleep, and coffee tracking"

  time_partitioning {
    type  = "DAY"
    field = "entry_date"
    
    # Optional: auto-delete old partitions
    # expiration_ms = 3600000 * 24 * 365 * 2  # 2 years
  }

  # Clustering for query optimization by user_id
  clustering = ["user_id"]

  # Table schema
  schema = jsonencode([
    {
      name        = "id"
      type        = "STRING"
      mode        = "REQUIRED"
      description = "Unique entry ID (UUID)"
    },
    {
      name        = "entry_date"
      type        = "DATE"
      mode        = "REQUIRED"
      description = "Date of the entry"
    },
    {
      name        = "mood"
      type        = "INT64"
      mode        = "NULLABLE"
      description = "Overall mood rating (1-10)"
    },
    {
      name        = "anxiety"
      type        = "INT64"
      mode        = "NULLABLE"
      description = "Anxiety level (1-10)"
    },
    {
      name        = "nutrition"
      type        = "INT64"
      mode        = "NULLABLE"
      description = "Nutrition quality rating (1-10)"
    },
    {
      name        = "sleep_hours"
      type        = "FLOAT64"
      mode        = "NULLABLE"
      description = "Hours of sleep (0-24)"
    },
    {
      name        = "coffee_cups"
      type        = "INT64"
      mode        = "NULLABLE"
      description = "Number of coffee cups consumed"
    },
    {
      name        = "created_at"
      type        = "TIMESTAMP"
      mode        = "NULLABLE"
      description = "Record creation timestamp"
    },
    {
      name        = "user_id"
      type        = "STRING"
      mode        = "NULLABLE"
      description = "User identifier for future auth"
    }
  ])

  labels = {
    app         = "daily-tracker"
  }

  # Prevent accidental deletion
  # deletion_protection = var.environment == "prod" ? true : false
}

# ============================================
# Outputs
# ============================================

output "dataset_id" {
  description = "BigQuery Dataset ID"
  value       = google_bigquery_dataset.daily_metrics.dataset_id
}

output "table_id" {
  description = "BigQuery Table ID"
  value       = google_bigquery_table.entries.table_id
}

output "full_table_id" {
  description = "Full BigQuery Table ID (project.dataset.table)"
  value       = "${var.project_id}.${google_bigquery_dataset.daily_metrics.dataset_id}.${google_bigquery_table.entries.table_id}"
}
