provider "google" {
  project     = var.gcp_project
  region      = var.region_default
  credentials = file(var.google_application_credentials)
}

provider "google-beta" {
  project     = var.gcp_project
  region      = var.region_default
  credentials = file(var.google_application_credentials)
}


terraform {
  backend "gcs" {
    bucket = "georgef-tfs"
  }
}


# module "mongo" {
#   source          = "./modules/vm"
#   instance_name   = "mongo"
#   vpc_name        = var.vpc_name
#   subnet_name     = "default"
#   zone            = "${var.region}-a"
#   external_ip     = true
#   start_up_script = file("./startups/mongodb.sh")
#   tags            = ["mongodb"]
# }

# module "mongo-client" {
#   source          = "./modules/vm"
#   instance_name   = "mongo-client"
#   vpc_name        = var.vpc_name
#   subnet_name     = "default"
#   zone            = "${var.region}-a"
#   external_ip     = true
#   start_up_script = file("./startups/mongodb.sh")
#   tags            = ["mongodb"]
# }

# resource "null_resource" "populate_mongo" {
#   depends_on = [
#     module.mongo
#   ]
#   provisioner "local-exec" {
#     command = <<-EOF
#     echo "starting mongo populate"
#     sleep 60
#     gcloud compute scp ./mongo_conf/populate_db.py root@mongo:/  --zone="${var.region}-a"
#     # gcloud compute ssh --zone="${var.region}-a" mongo -- 'cd / && python3 populate_db.py'
#     EOF
#   }
# }