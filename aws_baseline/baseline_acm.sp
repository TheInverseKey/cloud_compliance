benchmark "baseline_aws_acm" {
  title         = "ACM"
  children = [
    aws_compliance.control.foundational_security_acm_1
  ]
}
