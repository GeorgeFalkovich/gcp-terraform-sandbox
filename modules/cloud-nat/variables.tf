variable "router_name" { type = string }
variable "region" { type = string }
variable "network" { type = string }
variable "asn" { type = number }
variable "nat_name" { type = string }
variable "nat_ip_allocate_option" { type = string }
variable "source_subnetwork_ip_ranges_to_nat" { type = string }
variable "log_enable" { type = bool }
variable "log_filter" { type = string }
variable "vpc_name" {
  description = "VPC name"
}
