variable "name" {
  type = string
}

variable "record" {
  type = string
}

variable "type" {
  type = string
}

variable "value" {
  type = string
}

variable "remark" {
  type = string
}

variable "status" {
  type    = string
  default = "ENABLE"
}

variable "ttl" {
  type    = number
  default = 600
}

variable "line" {
  type    = string
  default = "default"
}
