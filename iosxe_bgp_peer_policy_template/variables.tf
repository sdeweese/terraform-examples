variable "switch_ip" {
  description = "Management IP address or hostname for the reserved IOS XE device."
  type        = string
}

variable "switch_username" {
  description = "Username provided for NETCONF access to the device."
  type        = string
}

variable "switch_password" {
  description = "Password provided for NETCONF access to the device."
  type        = string
  sensitive   = true
}
