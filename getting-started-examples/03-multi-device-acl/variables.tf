variable "switch5_host" {
  description = "Management IP address or hostname for the first lab switch."
  type        = string
}

variable "switch55_host" {
  description = "Management IP address or hostname for the second lab switch."
  type        = string
}

variable "switch_username" {
  description = "NETCONF username shared by both switches."
  type        = string
  default     = "admin"
}

variable "switch_password" {
  description = "NETCONF password shared by both switches."
  type        = string
  sensitive   = true
}

variable "acl_name" {
  description = "Unique extended ACL name for the lab exercise."
  type        = string
  default     = "TF_LAB_MGMT_INBOUND"
}
