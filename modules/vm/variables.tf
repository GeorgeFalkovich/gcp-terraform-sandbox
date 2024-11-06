variable "instance_image" {
  type    = string
  default = "ubuntu-2004-focal-v20240307b"
}

variable "instance_type" {
  type    = string
  default = "e2-medium"
}

variable "zone" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "local_exec_command" {
  type    = string
  default = ""
}

variable "private_ip" {
  type    = string
  default = ""
}

variable "vpc_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "start_up_script" {
  type    = string
  default = ""
}


variable "disk_size" {
  type    = string
  default = "30"
}


variable "disk_type" {
  type    = string
  default = "pd-balanced"
}

variable "tags" {
  type = list(any)
}

variable "assign_public_ip" {
  description = "assign ephemeral public ip to vm"
  type        = bool
  default     = true
}

variable "access_config_nat_ip" {
  type    = string
  default = ""
}

variable "labels" {
  type    = map(string)
  default = { created_by = "terraform" }
}

variable "boot_disk_attached" {
  type    = bool
  default = false
}

variable "disk_source" {
  type    = string
  default = ""
}