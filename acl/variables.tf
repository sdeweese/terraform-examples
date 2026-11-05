variable "switch1_host" {
  description = "Management IP address or hostname for switch 1."
  type        = string
}

variable "switch2_host" {
  description = "Management IP address or hostname for switch 2."
  type        = string
}

variable "switch_username" {
  description = "Administrative username shared by both switches."
  type        = string
  default     = "admin"
}

variable "switch_password" {
  description = "Administrative password shared by both switches."
  type        = string
  sensitive   = true
}
