benchmark "aws_baseline_acm" {
  title         = "ACM"
  children = [
    control.ACM_certs
  ]
}



control "ACM_certs" {
  title         = "1 Imported ACM certificates should be renewed after a specified time period"
  description   = "This control checks whether ACM certificates in your account are marked for expiration within 30 days. It checks both imported certificates and certificates provided by AWS Certificate Manager."
  severity      = "medium"
  sql         = aws_compliance.query.acm_certificate_expires_30_days
  
}