variable "environment" {
  type    = string
  default = "dev"
}

variable "region_shortname" {
  type    = string
  default = "euc1"
}

variable "name" {
  description = "Project name"
  type        = string
  default     = "myproje"
}

variable "prefix" {
  description = "Team name"
  type        = string
  default     = "enterprise"
}

variable "costcenter" {
  type    = string
  default = "dummyXYZ"
}