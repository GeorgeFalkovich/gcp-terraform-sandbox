### Global vars
variable "project_id" {
  description = "The project ID that will host our infrastructure"
}

variable "region" {
  description = "Default region"
}

variable "node_tags" {
  description = "Tags for GKE nodes"
  type        = list(string)
  default     = []
}

variable "zone" {
  description = "Default zone"
}

variable "vpc_name" {
  description = "VPC name"
}

variable "vpc_subnet_name" {
  description = "Subnet name"
}

variable "google_application_credentials" {
  description = "Service Account location"
}

variable "machine_type" {
  description = "Type of machine for GKE nodes"
  type        = string
  default     = "e2-small"
}

variable "nat_log_filter" {
  description = "The filter used to log NAT gateway traffic"
}

variable "router_name" {
  description = "The name of the router"
}

variable "nat_log_enable" {
  description = "Enable logging for the NAT gateway"
  type        = bool
  default     = false
}

variable "nat_name" {
  description = "The name of the NAT gateway"
}

variable "network_name" {
  description = "The name of the network"
}

variable "nat_ip_allocate_option" {
  description = "The IP allocation option for the NAT gateway"
}

variable "nat_asn" {
  description = "The ASN for the NAT gateway"
}

variable "nat_source_subnetwork_ip_ranges" {
  description = "The source subnetwork IP ranges for the NAT gateway"
}

variable "full_vpc_name" {
  description = "Full VPC name including project"
  type        = string

}

variable "resource_tags" {
  description = "Random tags for resources"
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "george"
    project     = "alpha"
    costcenter  = "rnd-123"
    department  = "engineering"
  }
}




