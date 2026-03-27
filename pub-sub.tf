resource "google_pubsub_topic" "my_topic" {
  name = "my-topic"
}

resource "google_pubsub_subscription" "my_subscription" {
  name  = "my-subscription"
  topic = google_pubsub_topic.my_topic.id
}
