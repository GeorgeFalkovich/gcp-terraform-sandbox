# resource "null_resource" "copy_and_unzip_portfolio" {
#   provisioner "local-exec" {
#     command = <<-EOC
#       # sleep 20
#       # gcloud compute scp startup/portfolio.zip root@portfolio:/var/www/html/portfolio.zip --zone=${var.zone_default} &&
#       # gcloud compute ssh root@portfolio --zone=${var.zone_default} --command="unzip -o /var/www/html/portfolio.zip -d /var/www/html/ && rm /var/www/html/portfolio.zip"
#     EOC
#   }

#   triggers = {
#     # file_md5 = filemd5("startup/portfolio.zip")
#     zone = var.zone_default
#   }

#   depends_on = [module.portfolio]
# }
