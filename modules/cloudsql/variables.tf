variable "instance_name" { type = string }
variable "database_version" { type = string }
variable "region" { type = string }
variable "deletion_protection" {
  type    = bool
  default = false
}
variable "tier" { type = string }
variable "backup_enabled" {
  type    = bool
  default = false
}
variable "ipv4_enabled" {
  type    = bool
  default = true
}
variable "private_network" { type = string }
variable "enable_private_path" {
  type    = bool
  default = false
}
variable "db_name" { type = string }
variable "db_users" {
  description = "Map of usernames to passwords"
  type        = map(string)
}
variable "db_password" { type = string }
variable "vpc_name" { type = string }
variable "peering_range_name" {
  type    = string
  default = "default-ip-range"
}
variable "peering_prefix_length" {
  type    = number
  default = 24
}