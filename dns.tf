resource "alicloud_alidns_record" "record" {
  domain_name = var.name
  rr          = var.record
  type        = var.type
  value       = var.value
  remark      = var.remark
  status      = var.status
  ttl         = var.ttl
  line        = var.line
}
