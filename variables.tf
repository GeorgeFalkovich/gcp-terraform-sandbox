### Global vars
variable "gcp_project" {
  description = "The projecd ID that will host our infrastructure"
}

variable "region_default" {
  description = "Default region"
}

variable "zone_default" {
  description = "Default zone"
}

variable "vpc_default" {
  description = "VPC default name"
}

variable "vpc_subnet_default" {
  description = "Default subnet"
}

variable "google_application_credentials" {
  description = "Service Account location"
}


