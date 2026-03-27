# module "stress_test_vm" {
#   source           = "./modules/vm"
#   instance_name    = "stress-test-vm"
#   vpc_name         = var.vpc_name
#   subnet_name      = var.vpc_subnet_name
#   zone             = var.zone
#   instance_type    = "n1-standard-1"
#   assign_public_ip = false
#   start_up_script  = file("./startup/stress-test-tools.sh")
#   tags             = ["stress-test"]
# }


module "maintanance-server" {
  source           = "./modules/vm"
  instance_name    = "maintanance-server"
  vpc_name         = var.vpc_name
  subnet_name      = var.vpc_subnet_name
  zone             = var.zone
  assign_public_ip = true
  start_up_script  = file("./startup/maintenance.sh")
  tags             = ["mongodb"]
  enable_serial_port = true
  desired_status   = "TERMINATED"
}

# module "test-vm" {
#   source           = "./modules/vm"
#   instance_name    = "test-vm"
#   vpc_name         = var.vpc_name
#   subnet_name      = var.vpc_subnet_name
#   zone             = var.zone
#   assign_public_ip = true
#   start_up_script  = file("./startup/maintenance.sh")
#   tags             = ["test-vm"]
#   enable_serial_port = true
# }

# module "mongo-client" {
#   source          = "./modules/vm"
#   instance_name   = "mongo-client"
#   vpc_name        = var.vpc_name
#   subnet_name     = var.vpc_subnet_name
#   zone            = var.zone
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
#     gcloud compute scp ./mongo_conf/populate_db.py root@mongo:/  --zone="${var.zone}"
#     # gcloud compute ssh --zone="${var.zone}" mongo -- 'cd / && python3 populate_db.py'
#     EOF
#   }
# }